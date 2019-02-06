# A.S.A.R.E's

## One (1)

This exercise uses a [Cloud Formation](https://aws.amazon.com/cloudformation/) template to create the required AWS infrastructure (and formats the EBS volume via [User Data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html)).  Next an [OpsWorks Stack](https://aws.amazon.com/opsworks/stacks/) using [Chef Solo](https://docs.chef.io/chef_solo.html) configures the instance to be a web server, mounts the EBS volume as the HTML storage location, and adds a few files to serve (including the `index.html`).

### contents

```
1/webserver.yaml
```
A Cloud Formation template that creates a single `t2.micro` instance with attached EIP and security group for SSH/HTTP.  The default AMI is a standard *Amazon Linux 2 AMI* but may be provided at launch time.

```
webserver
```
A Chef (solo) cookbook for OpsWorks Stacks that configures an instance to be a web server and serve some files from a (newly) mounted EBS volume (see the `webserver/recipes/default.rb` recipe for details).

### steps

1. Create and launch a CloudFormation stack from the `webserver.yaml` Cloud Formation template (e.g. in `us-west-2`)

2. Create an OpsWorks Stacks stack, choosing the just-created instance. Follow the console-provided steps to setup the instance for OpsWorks Stacks.

   **NOTE:** You'll need to ssh into the instance, [configure the aws-cli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html), and register the instance with Opsworks.

3. In the Stack Settings, set the repository type to `git` and the URL to `https://github.com/jguice/asares.git`

4. Create a Web Server layer that runs the recipe `webserver` during the deploy phase.

5. Assign the instance created from the Cloud Formation template to the Web Server layer and watch the magic. 🎩

## Two (2)

### contents

```
2/AWS Architecture Mind Map.pdf
```
Mind map used for initial note-taking, requirements capturing, and brainstorming of design, components, etc.

```
AWS Customer Proposal.pdf
```
Final customer-facing proposal document/deliverable outlining the solution and architecture.


