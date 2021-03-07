Vim�UnDo� �ҖL��r�`�?B}%����Բ[�y�;�ijפI   �                                  `�/    _�                     �        ����                                                                                                                                                                                                                                                                                                                                                             `	�8     �   �               �   �            5�_�                    �        ����                                                                                                                                                                                                                                                                                                                                                             `	�B     �   �   �   �        �   �   �   �    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             `	�Y     �   �   �          6  description = "Whether to attach the Amazon managed 5�_�                    �        ����                                                                                                                                                                                                                                                                                                                                                             `	�Z    �   �   �   �        �   �   �   �    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             `	��    �   �   �          }�   �   �            default = false�   �   �            type = bool�   �   �          variable "attach_eks_cni" {�   �   �           �   �   �          }�   �   �            type        = string�   �   �          ;  description = "IAM Role Name for EKS Cluster Auto-Scaler"�   �   �          -variable "eks_cluster_autoscaler_role_name" {�   �   �           �   �   �          }�   �   �            type        = string�   �   �          .  description = "IAM Role ARN for KIAM Server"�   �   �          !variable "kiam_server_role_arn" {�   �   �           �   �   �          }�   �   �            type = string�   �   �          )variable "rancher2_cluster_description" {�   �   �           �   �   �          }�   �   �            default     = true�   �   �            type        = bool�   �   �          7  description = "If true, skips certificate validation"�   �   �          variable "rancher2_insecure" {�   �   �           �   �   �          }�   �   �            type        = string�   �   �          (  description = "Rancher API Secret Key"�   �   �           variable "rancher2_secret_key" {�   �   �           �   �   �          }�   �   �            type        = string�   �   �          (  description = "Rancher API Access Key"�   �   �           variable "rancher2_access_key" {�   �   �           �   �   �          }�   �   �            type        = string�   �   �          !  description = "Rancher API URL"�   �   �          variable "rancher2_api_url" {�   �   �          # rancher variables�   �   �           �   �   �          }�   �   �            type        = string�   �   �          �  description = "Infrastructure Environment name to register the new cluster in. To get a list of infra envs from zordon: curl -u $ZORDON_USER:$ZORDON_PASS $ZORDON_API/infrastructure_environments"�   �   �          variable "zordon_infra_env" {�   �   �           �   �   �          }�   �   �            type        = string�   �   �          p  description = "Zordon password. Optionally, you can set REST_API_PASSWORD=$ZORDON_PASS, if ZORDON_PASS is set"�   �   �          variable "zordon_password" {�   �   �           �   �   �          }�   �   �            type        = string�   �   �          l  description = "Zordon user. Optionally, you can set REST_API_USERNAME=$ZORDON_USER, if ZORDON_USER is set"�   �   �          variable "zordon_username" {�      �           �   ~   �          }�   }               default     = false�   |   ~            type        = bool�   {   }          1  description = "Disable certificate validations"�   z   |          variable "zordon_insecure" {�   y   {           �   x   z          }�   w   y            default     = true�   v   x            type        = bool�   u   w          >  description = "Print REST API debug logs. Must set TF_LOG=1"�   t   v          variable "zordon_debug" {�   s   u           �   r   t          }�   q   s          +  default     = "https://zordon.zeta.tools"�   p   r            type        = string�   o   q             description = "Zordon API URL"�   n   p          variable "zordon_url" {�   m   o          # zordon variables�   l   n           �   k   m          }�   j   l            }�   i   k              "prod"           = "prod"�   h   j              "production"     = "prod"�   g   i              "stg"            = "stg"�   f   h              "staging"        = "stg"�   e   g              "dev"            = "dev"�   d   f              "development"    = "dev"�   c   e              "ap-south-1"     = "aas1"�   b   d              "cn-north-1"     = "acn1"�   a   c              "sa-east-1"      = "ase1"�   `   b              "ap-northeast-2" = "aane2"�   _   a              "ap-northeast-1" = "aane1"�   ^   `              "ap-southeast-2" = "aase2"�   ]   _              "ap-southeast-1" = "aase1"�   \   ^              "eu-central-1"   = "aec1"�   [   ]              "eu-west-1"      = "aew1"�   Z   \              "us-west-2"      = "auw2"�   Y   [              "us-west-1"      = "auw1"�   X   Z              "us-west-2"      = "auw2"�   W   Y            default = {�   V   X            type = map(string)�   U   W          variable "namemap" {�   T   V           �   S   U          }�   R   T            default = false�   Q   S            type    = bool�   P   R          (variable "manage_worker_iam_resources" {�   O   Q           �   N   P          }�   M   O            default = false�   L   N            type    = bool�   K   M          +variable "cluster_endpoint_public_access" {�   J   L           �   I   K          }�   H   J            default = false�   G   I            type    = bool�   F   H          ,variable "cluster_endpoint_private_access" {�   E   G           �   D   F          }�   C   E            }�   B   D              "elb" = "ELB",�   A   C              "ilb" = "ILB",�   @   B              "app" = "APP",�   ?   A            default = {�   >   @            type = map(string)�   =   ?          variable "subnet_tags" {�   <   >           �   ;   =          }�   :   <            type        = string�   9   ;          K  description = "Route53 Internal Hosted Zone Name (e.g. 'dev.auw2.zuora')"�   8   :          &variable "internal_hosted_zone_name" {�   7   9           �   6   8          }�   5   7            type = list(string)�   4   6          variable "subnet_ids" {�   3   5           �   2   4          }�   1   3            type = string�   0   2          variable "vpc_id" {�   /   1           �   .   0          }�   -   /            type = list(string)�   ,   .          &variable "worker_security_group_ids" {�   +   -           �   *   ,          }�   )   +            type        = any�   (   *          �  description = "A list of node group objects. See 'workers_group_defaults_defaults' for valid key/values: https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/local.tf#L37-L103"�   '   )          variable "node_groups" {�   &   (           �   %   '          }�   $   &            type        = bool�   #   %          B  description = "If true, enable cloudwatch logs for EKS clusters"�   "   $           variable "enable_cluster_logs" {�   !   #           �       "          }�      !            type        = number�                   description = "EKS version"�                variable "kubernetes_version" {�                 �                }�                  type        = string�                A  description = "Dotted cluster name (e.g. eks.0.dev.auw2.zuora)"�                variable "dot_name" {�                 �                }�                  type        = string�                A  description = "Dashed cluster name (e.g. eks-0-dev-auw2-zuora)"�                variable "dash_name" {�                 �                }�                  type        = string�                9  description = "Environment number (e.g. 0,1,2, ...etc)"�                variable "environment_number" {�                 �                }�                  type        = string�   
             @  description = "Environment name (e.g. dev, stg, prod, ...etc)"�   	             variable "environment_name" {�      
           �      	          }�                  type = string�                variable "region" {�                 �                }�                  type        = string�                $  description = "AWS account number"�                 variable "account_number" {5�_�                    �        ����                                                                                                                                                                                                                                                                                                                                                             `��     �               �   variable "account_number" {   $  description = "AWS account number"     type        = string   }       variable "region" {     type = string   }       variable "environment_name" {   @  description = "Environment name (e.g. dev, stg, prod, ...etc)"     type        = string   }       variable "environment_number" {   9  description = "Environment number (e.g. 0,1,2, ...etc)"     type        = string   }       variable "dash_name" {   A  description = "Dashed cluster name (e.g. eks-0-dev-auw2-zuora)"     type        = string   }       variable "dot_name" {   A  description = "Dotted cluster name (e.g. eks.0.dev.auw2.zuora)"     type        = string   }       variable "kubernetes_version" {     description = "EKS version"     type        = number   }        variable "enable_cluster_logs" {   B  description = "If true, enable cloudwatch logs for EKS clusters"     type        = bool   }       variable "node_groups" {   �  description = "A list of node group objects. See 'workers_group_defaults_defaults' for valid key/values: https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/local.tf#L37-L103"     type        = any   }       &variable "worker_security_group_ids" {     type = list(string)   }       variable "vpc_id" {     type = string   }       variable "subnet_ids" {     type = list(string)   }       &variable "internal_hosted_zone_name" {   K  description = "Route53 Internal Hosted Zone Name (e.g. 'dev.auw2.zuora')"     type        = string   }       variable "subnet_tags" {     type = map(string)     default = {       "app" = "APP",       "ilb" = "ILB",       "elb" = "ELB",     }   }       ,variable "cluster_endpoint_private_access" {     type    = bool     default = false   }       +variable "cluster_endpoint_public_access" {     type    = bool     default = false   }       (variable "manage_worker_iam_resources" {     type    = bool     default = false   }       variable "namemap" {     type = map(string)     default = {       "us-west-2"      = "auw2"       "us-west-1"      = "auw1"       "us-west-2"      = "auw2"       "eu-west-1"      = "aew1"       "eu-central-1"   = "aec1"       "ap-southeast-1" = "aase1"       "ap-southeast-2" = "aase2"       "ap-northeast-1" = "aane1"       "ap-northeast-2" = "aane2"       "sa-east-1"      = "ase1"       "cn-north-1"     = "acn1"       "ap-south-1"     = "aas1"       "development"    = "dev"       "dev"            = "dev"       "staging"        = "stg"       "stg"            = "stg"       "production"     = "prod"       "prod"           = "prod"     }   }       # zordon variables   variable "zordon_url" {      description = "Zordon API URL"     type        = string   +  default     = "https://zordon.zeta.tools"   }       variable "zordon_debug" {   >  description = "Print REST API debug logs. Must set TF_LOG=1"     type        = bool     default     = true   }       variable "zordon_insecure" {   1  description = "Disable certificate validations"     type        = bool     default     = false   }       variable "zordon_username" {   l  description = "Zordon user. Optionally, you can set REST_API_USERNAME=$ZORDON_USER, if ZORDON_USER is set"     type        = string   }       variable "zordon_password" {   p  description = "Zordon password. Optionally, you can set REST_API_PASSWORD=$ZORDON_PASS, if ZORDON_PASS is set"     type        = string   }       variable "zordon_infra_env" {   �  description = "Infrastructure Environment name to register the new cluster in. To get a list of infra envs from zordon: curl -u $ZORDON_USER:$ZORDON_PASS $ZORDON_API/infrastructure_environments"     type        = string   }       # rancher variables   variable "rancher2_api_url" {   !  description = "Rancher API URL"     type        = string   }        variable "rancher2_access_key" {   (  description = "Rancher API Access Key"     type        = string   }        variable "rancher2_secret_key" {   (  description = "Rancher API Secret Key"     type        = string   }       variable "rancher2_insecure" {   7  description = "If true, skips certificate validation"     type        = bool     default     = true   }       )variable "rancher2_cluster_description" {     type = string   }       !variable "kiam_server_role_arn" {   .  description = "IAM Role ARN for KIAM Server"     type        = string   }       -variable "eks_cluster_autoscaler_role_name" {   ;  description = "IAM Role Name for EKS Cluster Auto-Scaler"     type        = string   }       variable "attach_eks_cni" {     type    = bool     default = false   }5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `�     �               �   variable "account_number" {   $  description = "AWS account number"     type        = string   }       variable "region" {     type = string   }       variable "environment_name" {   @  description = "Environment name (e.g. dev, stg, prod, ...etc)"     type        = string   }       variable "environment_number" {   9  description = "Environment number (e.g. 0,1,2, ...etc)"     type        = string   }       variable "dash_name" {   A  description = "Dashed cluster name (e.g. eks-0-dev-auw2-zuora)"     type        = string   }       variable "dot_name" {   A  description = "Dotted cluster name (e.g. eks.0.dev.auw2.zuora)"     type        = string   }       variable "kubernetes_version" {     description = "EKS version"     type        = number   }        variable "enable_cluster_logs" {   B  description = "If true, enable cloudwatch logs for EKS clusters"     type        = bool   }       variable "node_groups" {   �  description = "A list of node group objects. See 'workers_group_defaults_defaults' for valid key/values: https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/local.tf#L37-L103"     type        = any   }       &variable "worker_security_group_ids" {     type = list(string)   }       variable "vpc_id" {     type = string   }       variable "subnet_ids" {     type = list(string)   }       &variable "internal_hosted_zone_name" {   K  description = "Route53 Internal Hosted Zone Name (e.g. 'dev.auw2.zuora')"     type        = string   }       variable "subnet_tags" {     type = map(string)     default = {       "app" = "APP",       "ilb" = "ILB",       "elb" = "ELB",     }   }       ,variable "cluster_endpoint_private_access" {     type    = bool     default = false   }       +variable "cluster_endpoint_public_access" {     type    = bool     default = false   }       (variable "manage_worker_iam_resources" {     type    = bool     default = false   }       variable "namemap" {     type = map(string)     default = {       "us-west-2"      = "auw2"       "us-west-1"      = "auw1"       "us-west-2"      = "auw2"       "eu-west-1"      = "aew1"       "eu-central-1"   = "aec1"       "ap-southeast-1" = "aase1"       "ap-southeast-2" = "aase2"       "ap-northeast-1" = "aane1"       "ap-northeast-2" = "aane2"       "sa-east-1"      = "ase1"       "cn-north-1"     = "acn1"       "ap-south-1"     = "aas1"       "development"    = "dev"       "dev"            = "dev"       "staging"        = "stg"       "stg"            = "stg"       "production"     = "prod"       "prod"           = "prod"     }   }       # zordon variables   variable "zordon_url" {      description = "Zordon API URL"     type        = string   +  default     = "https://zordon.zeta.tools"   }       variable "zordon_debug" {   >  description = "Print REST API debug logs. Must set TF_LOG=1"     type        = bool     default     = true   }       variable "zordon_insecure" {   1  description = "Disable certificate validations"     type        = bool     default     = false   }       variable "zordon_username" {   l  description = "Zordon user. Optionally, you can set REST_API_USERNAME=$ZORDON_USER, if ZORDON_USER is set"     type        = string   }       variable "zordon_password" {   p  description = "Zordon password. Optionally, you can set REST_API_PASSWORD=$ZORDON_PASS, if ZORDON_PASS is set"     type        = string   }       variable "zordon_infra_env" {   �  description = "Infrastructure Environment name to register the new cluster in. To get a list of infra envs from zordon: curl -u $ZORDON_USER:$ZORDON_PASS $ZORDON_API/infrastructure_environments"     type        = string   }       # rancher variables   variable "rancher2_api_url" {   !  description = "Rancher API URL"     type        = string   }        variable "rancher2_access_key" {   (  description = "Rancher API Access Key"     type        = string   }        variable "rancher2_secret_key" {   (  description = "Rancher API Secret Key"     type        = string   }       variable "rancher2_insecure" {   7  description = "If true, skips certificate validation"     type        = bool     default     = true   }       )variable "rancher2_cluster_description" {     type = string   }       !variable "kiam_server_role_arn" {   .  description = "IAM Role ARN for KIAM Server"     type        = string   }       -variable "eks_cluster_autoscaler_role_name" {   ;  description = "IAM Role Name for EKS Cluster Auto-Scaler"     type        = string   }5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             `�.     �               �   P################################################################################   # AWS   P################################################################################       variable "tags" {   }       variable "dash_name" {   }       variable "dot_name" {   }       variable "hosted_zone_prefix" {   }       variable "account_number" {   $  description = "AWS account number"     type        = string   }       variable "region" {     description = "AWS Region"     type        = string     default     = "us-west-2"   }       variable "environment_name" {   @  description = "Environment name (e.g. dev, stg, prod, ...etc)"     type        = string   }       variable "environment_number" {   9  description = "Environment number (e.g. 0,1,2, ...etc)"     type        = string   }       variable "namemap" {     type = map(string)     default = {       "us-west-2"      = "auw2"       "us-west-1"      = "auw1"       "us-west-2"      = "auw2"       "eu-west-1"      = "aew1"       "eu-central-1"   = "aec1"       "ap-southeast-1" = "aase1"       "ap-southeast-2" = "aase2"       "ap-northeast-1" = "aane1"       "ap-northeast-2" = "aane2"       "sa-east-1"      = "ase1"       "cn-north-1"     = "acn1"       "ap-south-1"     = "aas1"       "development"    = "dev"       "dev"            = "dev"       "staging"        = "stg"       "stg"            = "stg"       "production"     = "prod"       "prod"           = "prod"     }   }       P################################################################################   	# ROUTE53   P################################################################################       &variable "internal_hosted_zone_name" {   K  description = "Route53 Internal Hosted Zone Name (e.g. 'dev.auw2.zuora')"     type        = string   }       P################################################################################   # VPC   P################################################################################       variable "vpc_id" {   )  description = "VPC for the EKS cluster"     type        = string   }       variable "subnet_tags" {     type = map(string)     default = {       "app" = "APP",       "ilb" = "ILB",       "elb" = "ELB",     }   }       P################################################################################   # EKS   P################################################################################       variable "kubernetes_version" {     description = "EKS version"     type        = number     default     = 1.16   }       variable "instance_type" {   /  description = "Instance type of worker nodes"     type        = string     default     = "m5.large"   }        variable "enable_cluster_logs" {   B  description = "If true, enable cloudwatch logs for EKS clusters"     type        = bool     default     = false   }       P################################################################################   # SGs   P################################################################################       variable "internal_lb_sgs" {   O  description = "List of security group ids to use for internal load balancers"     type        = list(string)     default     = []   }       variable "external_lb_sgs" {   O  description = "List of security group ids to use for external load balancers"     type        = list(string)     default     = []   }       variable "worker_sgs" {   =  description = "List of security group ids to use for nodes"     type        = list(string)     default     = []   }5��