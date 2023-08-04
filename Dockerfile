FROM hashicorp/terraform
ENTRYPOINT [ "/bin/sh" ]
# docker run -it --name terraform -v $(pwd):/terraform terraform