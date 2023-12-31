provider "aws" {
  region = "us-east-1"
}


resource "aws_iam_user" "iam_user" {
  name = "JVGC"
}

resource "aws_iam_policy" "custom_policy" {
  name   = "EC2"
  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"ec2:AuthorizeSecurityGroupIngress",
				"ec2:ReplaceRouteTableAssociation",
				"ec2:ModifyManagedPrefixList",
				"ec2:CreateIpamPool",
				"ec2:ResetInstanceAttribute",
				"ec2:ResetEbsDefaultKmsKeyId",
				"ec2:ModifyVpnConnectionOptions",
				"ec2:ReleaseIpamPoolAllocation",
				"ec2:CreateCoipPoolPermission",
				"ec2:DeleteNetworkInsightsAnalysis",
				"ec2:UnassignPrivateIpAddresses",
				"ec2:DisableImageDeprecation",
				"ec2:DeleteLocalGatewayRouteTable",
				"ec2:DeleteTransitGatewayPeeringAttachment",
				"ec2:ImportKeyPair",
				"ec2:CreateInstanceConnectEndpoint",
				"ec2:CancelCapacityReservationFleets",
				"ec2:CreateVerifiedAccessEndpoint",
				"ec2:ReplaceNetworkAclAssociation",
				"ec2:CreateVpcEndpointServiceConfiguration",
				"ec2:ModifyInstanceMaintenanceOptions",
				"ec2:*",
				"ec2:DeleteNatGateway",
				"ec2:CancelCapacityReservation",
				"ec2:EnableTransitGatewayRouteTablePropagation",
				"ec2:ModifyVpcEndpoint",
				"ec2:ModifyInstanceCapacityReservationAttributes",
				"ec2:CreatePublicIpv4Pool",
				"ec2:DeleteSpotDatafeedSubscription",
				"ec2:ImportVolume",
				"ec2:CreateVerifiedAccessGroup",
				"ec2:ModifyFleet",
				"ec2:DeleteLocalGatewayRouteTableVirtualInterfaceGroupAssociation",
				"ec2:RequestSpotFleet",
				"ec2:CreateSubnetCidrReservation",
				"ec2:DeleteTransitGatewayMulticastDomain",
				"ec2:DeleteVerifiedAccessInstance",
				"ec2:ModifyReservedInstances",
				"ec2:ReleaseAddress",
				"ec2:CreateTrafficMirrorTarget",
				"ec2:ModifyTrafficMirrorFilterRule",
				"ec2:CreateClientVpnRoute",
				"ec2:CreateLocalGatewayRoute",
				"ec2:SendSpotInstanceInterruptions",
				"ec2:ProvisionByoipCidr",
				"ec2:DisableSerialConsoleAccess",
				"ec2:DeprovisionIpamPoolCidr",
				"ec2:DeleteIpamScope",
				"ec2:DeleteVpcEndpointConnectionNotifications",
				"ec2:RestoreAddressToClassic",
				"ec2:DeleteCustomerGateway",
				"ec2:AssociateTransitGatewayPolicyTable",
				"ec2:ModifyVerifiedAccessEndpointPolicy",
				"ec2:ModifyVpcTenancy",
				"ec2:ApplySecurityGroupsToClientVpnTargetNetwork",
				"ec2:ConfirmProductInstance",
				"ec2:EnableEbsEncryptionByDefault",
				"ec2:PurchaseHostReservation",
				"ec2:ReplaceIamInstanceProfileAssociation",
				"ec2:DisassociateEnclaveCertificateIamRole",
				"ec2:UnassignPrivateNatGatewayAddress",
				"ec2:CreateTransitGatewayPrefixListReference",
				"ec2:ModifyTrafficMirrorSession",
				"ec2:DeleteTransitGatewayVpcAttachment",
				"ec2:CreateTransitGatewayPeeringAttachment",
				"ec2:AssociateTrunkInterface",
				"ec2:ReplaceNetworkAclEntry",
				"ec2:ModifyVpcPeeringConnectionOptions",
				"ec2:CreateTransitGatewayMulticastDomain",
				"ec2:CreateTrafficMirrorFilterRule",
				"ec2:ImportImage",
				"ec2:DeleteVpnConnection",
				"ec2:RejectVpcEndpointConnections",
				"ec2:ModifyEbsDefaultKmsKeyId",
				"ec2:ResetImageAttribute",
				"ec2:SendDiagnosticInterrupt",
				"ec2:DisableTransitGatewayRouteTablePropagation",
				"ec2:CreateVpcEndpointConnectionNotification",
				"ec2:AttachVerifiedAccessTrustProvider",
				"ec2:DisableAddressTransfer",
				"ec2:CreateTransitGatewayRouteTableAnnouncement",
				"ec2:AcceptAddressTransfer",
				"ec2:CreateCustomerGateway",
				"ec2:CreateIpam",
				"ec2:DeleteTransitGatewayRouteTable",
				"ec2:DeleteTransitGatewayRoute",
				"ec2:DeleteVpc",
				"ec2:DeleteCoipCidr",
				"ec2:CancelSpotFleetRequests",
				"ec2:DeleteTransitGatewayPolicyTable",
				"ec2:DeleteCoipPoolPermission",
				"ec2:CreateIpamResourceDiscovery",
				"ec2:ReplaceVpnTunnel",
				"ec2:ModifyInstanceAttribute",
				"ec2:CreateCoipCidr",
				"ec2:AttachClassicLinkVpc",
				"ec2:RestoreManagedPrefixListVersion",
				"ec2:CreateLaunchTemplateVersion",
				"ec2:DisableImageBlockPublicAccess",
				"ec2:StartVpcEndpointServicePrivateDnsVerification",
				"ec2:DeleteSecurityGroup",
				"ec2:CreateFpgaImage",
				"ec2:StartNetworkInsightsAccessScopeAnalysis",
				"ec2:AcceptReservedInstancesExchangeQuote",
				"ec2:DisassociateTrunkInterface",
				"ec2:EnableVpcClassicLinkDnsSupport",
				"ec2:AcceptTransitGatewayMulticastDomainAssociations",
				"ec2:DeleteSubnetCidrReservation",
				"ec2:CreateDhcpOptions",
				"ec2:ModifyVolumeAttribute",
				"ec2:DeleteClientVpnEndpoint",
				"ec2:DeleteLocalGatewayRouteTableVpcAssociation",
				"ec2:UpdateSecurityGroupRuleDescriptionsIngress",
				"ec2:DeleteRouteTable",
				"ec2:AllocateIpamPoolCidr",
				"ec2:ResetFpgaImageAttribute"
			],
			"Resource": "*"
		}
	]
}
EOF
}

resource "aws_iam_policy_attachment" "policy_bind" {
  name       = "EC2"
  users      = [aws_iam_user.iam_user.name]
  policy_arn = aws_iam_policy.custom_policy.arn
}
