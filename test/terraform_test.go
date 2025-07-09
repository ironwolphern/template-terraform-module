package test

import (
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// TestTerraformSimpleExample prueba el ejemplo simple del módulo
func TestTerraformSimpleExample(t *testing.T) {
	t.Parallel()

	// Generar un nombre único para evitar conflictos
	uniqueID := random.UniqueId()
	projectName := "test-simple-" + uniqueID

	// Configurar variables de Terraform
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Ruta al código de Terraform que queremos probar
		TerraformDir: "../examples/simple",

		// Variables a pasar al código de Terraform usando -var
		Vars: map[string]interface{}{
			"project_name": projectName,
			"environment":  "test",
			"aws_region":   "us-east-1",
		},

		// Variables de entorno para configurar Terraform
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": "us-east-1",
		},
	})

	// Limpiar recursos al final del test
	defer terraform.Destroy(t, terraformOptions)

	// Ejecutar terraform init y terraform apply
	terraform.InitAndApply(t, terraformOptions)

	// Obtener outputs
	bucketID := terraform.Output(t, terraformOptions, "bucket_id")
	bucketARN := terraform.Output(t, terraformOptions, "bucket_arn")

	// Validar que los outputs no estén vacíos
	assert.NotEmpty(t, bucketID)
	assert.NotEmpty(t, bucketARN)

	// Validar que el bucket existe en AWS
	aws.AssertS3BucketExists(t, "us-east-1", bucketID)

	// Validar que el bucket tiene las configuraciones de seguridad correctas
	assertS3BucketSecurityConfiguration(t, "us-east-1", bucketID)
}

// TestTerraformCompleteExample prueba el ejemplo completo del módulo
func TestTerraformCompleteExample(t *testing.T) {
	t.Parallel()

	// Generar un nombre único para evitar conflictos
	uniqueID := random.UniqueId()
	projectName := "test-complete-" + uniqueID

	// Configurar variables de Terraform
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Ruta al código de Terraform que queremos probar
		TerraformDir: "../examples/complete",

		// Variables a pasar al código de Terraform usando -var
		Vars: map[string]interface{}{
			"project_name": projectName,
			"environment":  "test",
			"aws_region":   "us-east-1",
			"team_name":    "Test Team",
			"cost_center":  "TEST-001",
		},

		// Variables de entorno para configurar Terraform
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": "us-east-1",
		},

		// Configurar reintentos
		MaxRetries:         3,
		TimeBetweenRetries: 5 * time.Second,
	})

	// Limpiar recursos al final del test
	defer terraform.Destroy(t, terraformOptions)

	// Ejecutar terraform init y terraform apply
	terraform.InitAndApply(t, terraformOptions)

	// Obtener outputs
	bucketID := terraform.Output(t, terraformOptions, "bucket_id")
	bucketARN := terraform.Output(t, terraformOptions, "bucket_arn")
	bucketDomainName := terraform.Output(t, terraformOptions, "bucket_domain_name")

	// Validar que los outputs no estén vacíos
	assert.NotEmpty(t, bucketID)
	assert.NotEmpty(t, bucketARN)
	assert.NotEmpty(t, bucketDomainName)

	// Validar que el bucket existe en AWS
	aws.AssertS3BucketExists(t, "us-east-1", bucketID)

	// Validar que el bucket tiene las configuraciones de seguridad correctas
	assertS3BucketSecurityConfiguration(t, "us-east-1", bucketID)

	// Validar que el bucket tiene versionado habilitado
	assertS3BucketVersioningEnabled(t, "us-east-1", bucketID)

	// Validar que el bucket tiene encriptación habilitada
	assertS3BucketEncryptionEnabled(t, "us-east-1", bucketID)
}

// TestTerraformModuleValidation prueba la validación del módulo
func TestTerraformModuleValidation(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "../",
	}

	// Validar que la configuración de Terraform es válida
	terraform.Init(t, terraformOptions)
	terraform.Validate(t, terraformOptions)
}

// Funciones auxiliares para validaciones específicas

func assertS3BucketSecurityConfiguration(t *testing.T, region, bucketName string) {
	// Validar que el acceso público está bloqueado
	publicAccessBlock := aws.GetS3BucketPublicAccessBlock(t, region, bucketName)
	assert.True(t, publicAccessBlock.BlockPublicAcls)
	assert.True(t, publicAccessBlock.BlockPublicPolicy)
	assert.True(t, publicAccessBlock.IgnorePublicAcls)
	assert.True(t, publicAccessBlock.RestrictPublicBuckets)
}

func assertS3BucketVersioningEnabled(t *testing.T, region, bucketName string) {
	// Validar que el versionado está habilitado
	versioning := aws.GetS3BucketVersioning(t, region, bucketName)
	assert.Equal(t, "Enabled", versioning)
}

func assertS3BucketEncryptionEnabled(t *testing.T, region, bucketName string) {
	// Validar que la encriptación está habilitada
	encryption := aws.GetS3BucketEncryption(t, region, bucketName)
	assert.NotNil(t, encryption)
	assert.NotEmpty(t, encryption.Rules)
}

// Benchmark para medir el rendimiento de la creación de recursos
func BenchmarkTerraformApply(b *testing.B) {
	for i := 0; i < b.N; i++ {
		uniqueID := random.UniqueId()
		projectName := "bench-" + uniqueID

		terraformOptions := &terraform.Options{
			TerraformDir: "../examples/simple",
			Vars: map[string]interface{}{
				"project_name": projectName,
				"environment":  "test",
			},
		}

		terraform.InitAndApply(b, terraformOptions)
		terraform.Destroy(b, terraformOptions)
	}
}
