# linker-tool
Connect to Kubernetes service, ingress and nodes ports and replace services with local ports.

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

# Tool in action examples
 - <a href="https://user-images.githubusercontent.com/36018976/71224776-b009cf00-22d6-11ea-862c-7716a3e75fc2.gif" target="_blank">Forward the kubernetes dashboard.</a>
 - <a href="https://user-images.githubusercontent.com/36018976/71224784-b6984680-22d6-11ea-8f85-86e9ec70619d.gif" target="_blank">Forward a cluster node port.</a>
 - <a href="https://user-images.githubusercontent.com/36018976/71224782-b304bf80-22d6-11ea-8fb2-88b2939d944a.gif" target="_blank">Forward an ingress port (automatic /etc/hosts update).</a>
 - <a href="https://user-images.githubusercontent.com/36018976/71224767-aa13ee00-22d6-11ea-9ffa-22b79fc76c87.gif" target="_blank">Expose a local port to a cluster service.</a>(Linker exposed service)
  - <a href="https://user-images.githubusercontent.com/36018976/71224771-ada77500-22d6-11ea-9561-33a87d258e7f.gif" target="_blank">Use a linker exposed service to replace any cluster service temporaly.</a>
  - <a href="https://user-images.githubusercontent.com/36018976/71224783-b4ce8300-22d6-11ea-8343-16baf4c6b9b7.gif" target="_blank">Forward any service to the same host and port than in the cluster or directly to localhost.</a>
  - <a href="https://user-images.githubusercontent.com/36018976/71224800-bb5cfa80-22d6-11ea-945c-bbe7baf76b0d.gif" target="_blank">Forward other cluster linkers services to your localhost.</a>
  
<p align="center">
  <img src="https://user-images.githubusercontent.com/36018976/71224786-b7c97380-22d6-11ea-8337-16a01b012b88.gif">
</p>



# Requeriments
 - node v10.13.0
 
