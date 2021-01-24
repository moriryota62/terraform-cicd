data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "github_actions" {
  name               = "${var.pj}-GitHubRunnerRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = merge(
    {
      "Name" = "${var.pj}-GitHubRunnerRole"
    },
    var.tags
  )
}

resource "aws_iam_role_policy_attachment" "github_actions" {
  role       = aws_iam_role.github_actions.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  # policy_arn = aws_iam_policy.s3objectput.arn
}

resource "aws_iam_instance_profile" "github_runner" {
  name = "${var.pj}-github-runner-instance-profile"
  role = aws_iam_role.github_actions.name
}
