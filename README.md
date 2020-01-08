# linker-tool
A team focused tool to connect to Kubernetes service, ingress and nodes ports and replace services with local ports.

# Features
### Expose/Forward
- Kubernetes service port TCP/HTTP/HTTPS to its original host:port url.
- Kubernetes service port to a localhost port.
- The ingress 80 and 443 ports.
- Node ports.
- Automatic updates of /etc/hosts file (If readable/writable).
- Play/stop multiple services per session.

### Team port sharing
- Expose your local ports available for your team to connect locally  
- Link local services to replace a kubernetes service.

### Link/replace services
- Replace any service port with a team member port
- Review and get the env variables of the linked services

### Pivot servers
- Register multiple server to forward the ports
- Dedicate a pivot server per team or functionality like copy files
- Pivot server could could be intranet or in the cloud

# Tool in action
 - <a href="https://user-images.githubusercontent.com/36018976/71224776-b009cf00-22d6-11ea-862c-7716a3e75fc2.gif" target="_blank">Forward the kubernetes dashboard.</a>
 - <a href="https://user-images.githubusercontent.com/36018976/71224784-b6984680-22d6-11ea-8f85-86e9ec70619d.gif" target="_blank">Forward a cluster node port.</a>
 - <a href="https://user-images.githubusercontent.com/36018976/71224782-b304bf80-22d6-11ea-8fb2-88b2939d944a.gif" target="_blank">Forward an ingress port.</a>(automatic /etc/hosts update)
 - <a href="https://user-images.githubusercontent.com/36018976/71224767-aa13ee00-22d6-11ea-9ffa-22b79fc76c87.gif" target="_blank">Expose a local port to a cluster service.</a>(Linker exposed service)
  - <a href="https://user-images.githubusercontent.com/36018976/71224771-ada77500-22d6-11ea-9561-33a87d258e7f.gif" target="_blank">Use a linker exposed service to replace any cluster service temporaly.</a>
  - <a href="https://user-images.githubusercontent.com/36018976/71224783-b4ce8300-22d6-11ea-8343-16baf4c6b9b7.gif" target="_blank">Forward any service to the same host and port than in the cluster or directly to localhost.</a>
  - <a href="https://user-images.githubusercontent.com/36018976/71224800-bb5cfa80-22d6-11ea-945c-bbe7baf76b0d.gif" target="_blank">Forward other cluster linkers services to your localhost.</a>
  
<p align="center">
  <img src="https://user-images.githubusercontent.com/36018976/71224786-b7c97380-22d6-11ea-8337-16a01b012b88.gif">
</p>

# How it works? 
 
 - **Cluster handler:** This is a service running on the cluster in charge of forward a ssh port to a pivot server, you can have multiple cluster handler pods and pivot servers to have a nice and stable tunnels across multiple teams and dev workloads.
 - **Pivot server:** This is another server that acts as a common connectivity point bettween the cluster and the linkers, it is in charge of expose the ssh connection from the cluster handler to the linker users, the pivot can be an static IP, intranet IP or hostname, as long as the linkers and the cluster can reach the pivot.
 - **Linkers:** Those developers whose want to forward the cluster services to their localhost, share their local services with the cluster or other linkers, the **linker-tool** is in charge of the local linker functionality previously listed (There could be more elaborated cases where a cluster is a linker to another cluster)
 - **Linker user:** Keep the relation of the pivots, the cluster and their linkers, generate the cluster and pivot connector scripts and their tokens, **there is no need to connect to the linker account once the tokens and scripts are generated**, you could be completly offline or in a isolated network and the cluster/pivot/linker will work, the account is only for script and token generation to help with the auth and coordination of cluster, pivots and linkers, the tokens are an extra security layer for the cluster links. 

# Requeriments
 - node   v10.13
 - docker v19.03
 - docker-compose v1.20
 
# Getting started

 - Download the latest linker-tool release and run the start.sh script
```bash
curl -fsSL https://github.com/vicjicaman/linker-tool/archive/v1.70.1-master.tar.gz | tar -xzv
./start.sh
```

 <p align="center">
  <img src="https://user-images.githubusercontent.com/36018976/71369322-ab7d3900-25aa-11ea-8968-ab64188419e1.gif">
</p>

 - Get a linker user <a href="https://linker.repoflow.com/auth" target="_blank">Repoflow linker login.</a>
 - Create the pivot and the cluster handler
 - Configure and run the pivot docker-compose and create the namespace cluster handler
 
 <p align="center">
  <img src="https://user-images.githubusercontent.com/36018976/71369320-a8824880-25aa-11ea-8b60-8696d14570e9.gif">
</p>


 
 
## FAQ

<details>
<summary><b>Where are the ssh keys stored and shared?</b></summary>
A ssh key is generated inside your cluster handler as a secret, is up to you handle and share the keys with the allowed linkers, **we don't store/access any key to any cluster, node, pivot server**
</details>
<br>

<details>
<summary><b>Why do I need an user account?</b></summary>
The linker generate tokens to help with the coordination of the cluster services, the pivot servers and handle the relation of the user that are allowed to a given cluster handler.
To connect to a cluster handler you will need the ssh keys and the linker token, an authorized user would need to have both.
</details>
<br>

<details>
<summary><b>Do I need to keep a connection to the linker account service to use this tool?</b></summary>
No, you only need to contact the remote service during the login and token generation, the tokens are an extra security layer for the cluster links. 
</details>
<br>
 

Checkout our other tools and resources focused on increase the developers productivity working with multiple services and kubernetes.
- **repoflow-tool:** A tool focused on the development workflow with kubernetes and multiple repositories.
- **microservices:** A blog about it's own development and evolution running on kubernetes.
