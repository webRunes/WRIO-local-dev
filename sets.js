/**
 * Created by michbil on 03.04.17.
 */


const objSet = [1,3,5,7,6,11,13,15];

function deleteObj(arr,e) {
    let index = arr.indexOf(e);
    const cpy = arr.slice(0);
    if (index > -1) {
        cpy.splice(index,1);
    }
    return cpy;
}

objSet.map((i)=>{
   let s = deleteObj(objSet,i);
   s.map(j => {
       let m = deleteObj(s,j);
       m.map( k => {
           let sum = i+j+k;
           if (sum == 30) {
               console.log(i,j,k,' = ', sum)
           }

       });
   })
});