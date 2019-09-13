function su(arr){
    var res=[]
    var n=arr[0]
    for(var i=1;i<arr.length;i++){
        for(var j=i; j<arr.length;j++){
            if(arr[i]+arr[j] > n){
                res.push(arr[i])
            }
        }
    }

    return res
}

console.log(su([6,5,3,2,4,1,2]))