docker build -t helderlee/native-javalin:latest -t helderlee/native-javalin:$SHA .
docker push helderlee/native-javalin:latest
docker push helderlee/native-javalin:$SHA
kubectl apply -f k8s
kubectl set image deployments/app-deployment app=helderlee/native-javalin:$SHA