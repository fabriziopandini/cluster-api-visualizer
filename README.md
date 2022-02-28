# Cluster API Visualization App

Cluster API developers and operators often need to quickly get insight multicluster configuration. This app provides that insight by making Cluster API significantly more accessible and easier to understand for both new and experienced users. It gives a bird’s eye view of a multicluster architecture, visualizes all the Cluster API custom resources for each cluster, and provides quick access to the specs of any resource.

**Note:** This app is a prototype for Cluster API GUI. It's built using the Go and VueJS.

![Demo Recording](demo/demo.gif)

### Quick start

#### 1. Prerequisites

This app requires [Go 1.17](https://go.dev/doc/install), [Node.js](https://nodejs.org/en/), [npm](https://www.npmjs.com/), [Vue CLI](https://cli.vuejs.org/guide/installation.html), [Cluster API](https://github.com/kubernetes-sigs/cluster-api), and its [prerequisites](https://cluster-api.sigs.k8s.io/user/quick-start.html#common-prerequisites).

#### 2. Clone the repository

```
cd ${GOPATH}/src # Or your go directory if GOPATH is not set
git clone https://github.com/Jont828/capi-visualization.git
```

#### 3. Install Go packages

```
cd ${GOPATH}/src/capi-visualization/
go get ./...
```

Clone a copy of [Cluster API](https://github.com/kubernetes-sigs/cluster-api), with the following commands. This will allow the app to access local changes to the repo.

```
mkdir ${GOPATH}/src/sigs.k8s.io
cd ${GOPATH}/src/sigs.k8s.io
git clone https://github.com/kubernetes-sigs/cluster-api.git
cd cluster-api
go get ./...
```

#### 4. Install node packages

```
make npm-install
```


#### 5. Create a management cluster and workload cluster with Cluster API

Create a local management cluster with kind and a workload cluster by following the [Cluster API Quickstart](https://cluster-api.sigs.k8s.io/user/quick-start.html).

#### 6. Start the app

From `${GOPATH}/src/capi-visualization/`, build the application and start it with

```
make build
make run
```

### Development:

For development and testing, the app can be run with hot reloading. After completing step 5 above, start the Go server from `${GOPATH}/src/capi-visualization/` with

```
go run main.go
```

In a separate terminal, enter `${GOPATH}/src/capi-visualization/web` and start the Vue app with

```
npm run serve
```

**Optional:** Install [Air](https://github.com/cosmtrek/air) to run the Go server with hot reloading for development. It can be installed using the instructions on the repo or your preferred package manager. Once it's it's installed, set it up with the following commands.

```
cd ${GOPATH}/src/capi-visualization/
air init
```

Instead of `go run main.go`, run `air` to start the Go server.

### Contributing:

All contributions are welcome. If you'd like to help out, feel free fork the repo and submit a pull request. 

### Acknowledgements:

- The cluster trees are drawn in D3 using a modified version of [ssthouse/vue-tree-chart](https://github.com/ssthouse/vue-tree-chart)
- The tree is generated using the clusterctl client from [Cluster API](https://github.com/kubernetes-sigs/cluster-api)
- The Go server was developed from Trevor Taubitz's [tutorial](https://hackandsla.sh/posts/2021-06-18-embed-vuejs-in-go/) on embedding VueJS in Go and [tutorial](https://hackandsla.sh/posts/2021-11-06-serve-spa-from-go/) on serving single page apps from Go 
- Thanks to [Vuetify](https://vuetifyjs.com/en/) for providing a great UI component toolkit
