# Azure Terraform Project Starter

Welcome to the Azure Terraform Project Starter, a codebase that provides you with the terraform code needed to initiate your project on the Azure Cloud. This codebase includes a Terraform remote backend along with the primary Terraform code. 

To get started, follow the steps outlined below.

## Getting Started

### Prerequisites

- Ensure that you have Terraform installed in your local machine.
- Knowledge about Azure and Terraform is helpful.

### Setup Instructions

1. **Clone the Repository**

   Begin by cloning this repository into your local machine.

2. **Update .gitignore**

   Append `terraform.tfvars` to the `.gitignore` file.

3. **Update Project Name**

   Search for `{{project_name}}` across the project and replace it with `<YOUR_PROJECT_NAME>` of your choosing.

4. **Add Credentials**

   Navigate to `~/<project_dir>/terraform_remote_backend/terraform.tfvars` and add the required credentials. Repeat the process for `~/<project_dir>/terraform/terraform.tfvars`. For now, set `stage="dev"`. The other possible values are `np`, `prod` and `dev`.

5. **Initialize and Apply Terraform**

   Use the terminal to navigate to `~/<project_dir>/terraform_remote_backend`. Run the following commands:
   
   ```bash
   terraform init
   terraform apply
   ```

   Once the Terraform remote backend has been successfully applied, ensure to not change or update it again. If you need to change it, make sure you can migrate the remote backend. 

6. **Run the Shell Script**

   Navigate to `~/<project_dir>/terraform_remote_backend` and run the provided shell script with the following command:

   ```bash
   bash ./shell_tf_apply.sh
   ```

   This command will sync the environment remote backend, initialize Terraform, and run `terraform apply`.

Congratulations, your project is now ready to go!


### Project Structure

This project assumes the existence of three branches: `dev`, `np` (nonprod), and `prod` (the master branch). It is recommended not to alter these names. However, adding a new environment is straightforward. Extend the remote backend, then in `./terraform/.backends` configure the backend in the file `<environment_name>.tf.txt`.

While this project does not assume any CI/CD, a sample GitHub workflow is provided in `./.github_ci_cd`. This pipeline is ready to use and can be enabled by changing the name from `./.github_ci_cd` to `./.github`. In case of Gitlab, the CI/CD YAML is in `./.gitlab_ci_cd/.gitlab-ci.yml` copy it to `./.gitlab-ci.yml`. 

### Environment setup for Git CI/CD 

In order to setup the Git CI/CD you can look inside the pipeline code and
provide the required variables to the git platfrom. These can be found in 
script `./.github_ci_cd/workflows/<env>.yml` (~ line 23 - name: Create temporary tfvars file).
For `./.gitlab_ci_cd/.gitlab-ci.yml`, these can be found in (~ line 13 - .prepare_template: &prepare).
Use the DockerFile in the code. At the moment, it is hosted on `rajeshsupreet/terraform-azure-cli:latest`

### Additional Resources

Refer to the official [Terraform documentation](https://www.terraform.io/docs/index.html) and [Azure Documentation](https://azure.microsoft.com/) for more information.

## Feedback

For any questions or feedback, please open an issue in the GitHub repository.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.


# Azure Credentials

The values for these variables can be fetched as follows:

- Subscription ID:
    - Sign in to the Azure portal.
    - Click on "All services" in the left-hand menu.
    - In the list of resources, type "Subscriptions".
    - Select "Subscriptions".
    - Your subscription IDs are listed in the subscription ID column.

- Tenant ID:
    - Click on "Azure Active Directory" in the left-hand menu.
    - Click on "Properties".
    - The "Directory ID" is your tenant ID.
    
- Client ID and Client Secret:
    - These come from an Azure Active Directory Service Principal.
    - In the left-hand menu in the Azure portal, click on "Azure Active Directory".
    - Click on "App registrations".
    - Click on "New registration".
    - Fill in the name, select the supported account types, and click "Register".
    - After the application is created, you can find the Client ID labeled as "Application (client) ID".
    - Click on the created application.
    - Click on "Certificates & secrets".
    - Click on "New client secret".
    - Add a description, select an expiration time, and click "Add".
    - After the secret is created, the value of the secret is displayed. Make sure you copy this value; you will not be able to retrieve it after you leave this page.

Once all of this is done.

- Sign in to the Azure portal.
- In the left-hand menu, select "Azure Active Directory".
- Click on "App Registrations" and find your app (you can search using your client id).
- Note the "Object ID" as you'll need it later.
- In the left-hand menu, click on "Subscriptions", and select your subscription.
- In the left-hand menu for your subscription, click on "Access control (IAM)".
- Click "+ Add" > "Add role assignment".
- In the "Role" dropdown, select "Contributor" and "User Access Administrator".
- In the "Select" field, paste in the "Object ID" you copied earlier, then select the service principal that appears.
- Click "Save".