# A.S.A.R.E's

## One (1)

### contents

```
webserver.yaml
```
This Cloud Formation template creates a single `t2.micro` instance with attached EIP.  The default AMI is a standard
*Amazon Linux 2 AMI* but may be provided at launch time.

### steps

1. Create and launch a stack from the `webserver.yaml` Cloud Formation template.

2. Create an [OpsWorks Stacks](https://aws.amazon.com/opsworks/stacks/) stack, choosing the just-created instance.
Follow the console-provided steps to setup the instance for OpsWorks Stacks.

   **NOTE:** You'll need to ssh into the instance, [configure the aws-cli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html),
   and register the instance with Opsworks.

3. In the Stack Settings, set the repository type to `git` and the URL to `https://github.com/jguice/asares.git`

4. Create a Web Server layer that runs the recipe `webserver` during the deploy phase.

5. Assign the instance created from the Cloud Formation template to the Web Server layer and watch the magic. 🎩
