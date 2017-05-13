var cons = (a,b) => (x) => x ? a: b;

const list = cons(1,cons(2,cons(3,null)));

cons.prototype.toString = (l) => {
    const inner = (li,str) => {
        str = str + li(true);
        if (li(false) == null)
            console.log(str+')');
        else {
            str += ', ';
            return inner(li(false),str)
        }
    };
    return inner(l,'(')
};

const reverse = (l) => {
   const inner = (li, data) => {
       const newItem = cons(li(true),data);
       if (li(false) == null) {
           return newItem;
       } else {
           return inner(li(false),newItem);
       }
   };
   return inner(l,null);
};

console.log(list.toString());
console.log(reverse(list).toString());

class Node {
    constructor(head, tail) {
        this.head = head;
        this.tail = tail;
    }

    toString() {
        return this.head + " " + this.tail;
    }

}

class List {

    constructor() {
        this.beginning = null;
    }

    push(v) {
        this.head.tail = new Node(v,null)
    }

}


