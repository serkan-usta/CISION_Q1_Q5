# CISION from Questions 1 to Q5 :

You will find the following files : 

[Dockerfile](https://github.com/serkan-usta/CISION_Q1_Q5/blob/main/Dockerfile) : build sample nginx docker container (including image scan using trivy utility during build, if tool return non-zero exit code build will fail).Added html page( html/index.html) to check docker container functionality.

[k8s/nginx-statefulset.yaml](https://github.com/serkan-usta/CISION_Q1_Q5/blob/main/k8s/nginx-statefulset.yaml) : stateful set which deploys using GitHub Action from previously builded image; It includes resources and limits;

[k8s/pv.yaml](https://github.com/serkan-usta/CISION_Q1_Q5/blob/main/k8s/pv.yaml) : I have extend task a bit added volume and claim creation which will be used in stateful set;

github/workflows/nginx.yml : sample GitHub Action which build nginx docker file, update stateful set and deploy it to kubernetes;

**The question about sed usage implemented in Github Action to update image tag during deployment;
***I didn’t test actual pipeline functionality - it’s only sample to show GitHub flow build/deploy; Pipeline could be extended with additional steps;
