A UFO sighting database service... or at least an attempt.

Having not come from a DevSecOps background I had a lot to research to try to fulfill the goals of the "create production-ready, stable code that others will want to work with" Coding Challenge.

I discovered another world of Software Engineering that involved implementing security early on in the SDLC and throughout instead of just on the server. Even the application containers themselves must be secure.

Or as I learned is called a ShiftLeft Approach.

Production-ready code up to DevSecOps/Enterprise level standards with an unfamiliar stack and source (nuforc.org).

## How far did I get?

The below took a lot of research, tutorials, and reading documentation.
Application Security Program Handbook by Derek Fisher is a good start.

[Check it out here](https://learning.oreilly.com/library/view/application-security-program/9781633439818/)

### DevSecOps Pipeline

AWS EC2 Infrastructure built with Terraform.

An AWS EC2 instance was spun up with a security group, variables stored in Terraform cloud and Jenkins was installed.

Additionally, Jenkins was installed via which manages the following on the EC2 Instance:

- Docker

- Kubernetes

- Apache & Maeven
  This was the initial idea to create a Java Backend. However, I then decided to stick with NodeJS because I had a great idea that I could fit in a TypeScript-written frontend in 3 days. That did not happen.

- SCA via Snyk - see Jenkins file

- DAST via Snyk - see Jenkins file

- Deployment to AWS Kubernetes Cluster - see Jenkins file

- Build and Push application to AWS Elastic

GitHub Actions to lint, test and perform SAST on the development repo. I believe the paywall features have changed and API tokens aren't available to connect with Jenkins.

### The application

I implemented a stack using NGINX, PHP, MYSQL, and PYTHON. Each part of the stack is dockerized and connected via docker-compose.

Sadly I was not able to fulfill the primary goal of retrieving data from the website.

I was not able to access any exposed API so my earlier attempts to create a nodeJS api much less frontend did not happen. I changed gears to perhaps use Python to retrieve request data via sending post requests to their admin_ajax.php. Since it can be a vulnerability.

Oh and testing. There are no unit tests, Integration Tests, or E2E tests as I failed to provide a working application — just a shell of one.

## The Conclusion

It was a tough assignment to try to fulfill in 3 days' time. However, I thoroughly enjoyed the challenge.
