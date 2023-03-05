async function test() {
  return "test"; // повертає завжди Promise 
}

const t = test();
t.then((data)=>console.log(data, "---data from Promise "))
console.log(t, "***promise*");

async function getData(){
  // const res = fetch().then()
  const res = await fetch()
  // const data = (res).json().then()
  const data = await res.json()
  return data; // повертає завжди Promise 
}  

// await працює тільки в async function 

async function workWithUser(){
  try {
    const user = await getData();
  console.log(user);
  return;// вийшли з функції
  } catch (error) {
    console.log("!!!! error !!!");
  }
  
}

workWithUser();

