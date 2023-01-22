# 1. 네임스페이스 생성
kubectl create namespace argo-rollouts

# 2. Argo Rollout 설치
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml

# 3. Kubectl Plugin 설치(linux)
curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-linux-amd64
chmod +x ./kubectl-argo-rollouts-linux-amd64
sudo mv ./kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts

# 4. Argo Rollout Dashboard 기동 (http://localhost:3100)
kubectl argo rollouts dashboard
