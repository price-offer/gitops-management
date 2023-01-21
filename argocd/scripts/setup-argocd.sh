# argocd 네임스페이스 생성
kubectl create namespace argocd

# ArgoCD 설치 및 배포
kubectl kustomize ../manifests/| kubectl apply -n argocd -f -

# argocd-server의 type을 NodePort(32666)으로 변경
kubectl patch svc argocd-server -n argocd -p 'apiVersion: v1
kind: Service
metadata:
  labels:
    app.kubernetes.io/component: server
    app.kubernetes.io/name: argocd-server
    app.kubernetes.io/part-of: argocd
  name: argocd-server
spec:
  type: NodePort
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: 8080
    nodePort: 32666
  - name: https
    port: 443
    protocol: TCP
    targetPort: 8080
  selector:
    app.kubernetes.io/name: argocd-server'

# ArgoCD admin유저 패스워드 확인
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
