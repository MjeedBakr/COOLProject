class Employee inherits IO
{
    name : String;
    age : Int;
    salary : Int;
    isRetired : Bool;

    init(n: String, a: Int, s: Int) : Employee
    {
        {
            name <- n;
            age <- a;
            salary <- s;
            isRetired <- (60 < age);
            self;
        }
    };--end init

    displayRetiredEmployees() : Object
    {
        {
            out_string("Retired Employees: \n");
            if (isRetired)
            then
            {
                out_string("Name: ");
                out_string(name);
            }
            else out_string("\n") fi;
        }
    }; --end method displayRetiredEmployees()

    setName(n: String): Object
    {
        name <- n
    };--end setName

    setAge(a: Int): Object
    {
        age <- a
    };--end setAge

    setSalary(s: Int): Object
    {
        salary <- s
    };--end setSalary

    getName(): String
    {
        name
    };--end getName

    getAge(): Int
    {
        age
    };--end getAge

    getSalary(): Int
    {
        salary
    };--end getSalary

    getRetired(): Bool
    {
        isRetired
    };--end getRetired

}; --end class Employee

--class Node represents a node in a linked list
class Node inherits IO
{
    data: Employee; --store employee information
    next : Node; --points to the next node

    --constructor
    init(d: Employee, n: Node): Node
    {
        {
            data <- d;
            next <- n;
            self;
        }
    };-- end init

    setData(d: Employee) : Object
    {
            data <- d
    };--end setData method

    setNext(n: Node) : Object
    {
            next <- n
    };--end setNext method

    getData() : Employee
    {
        data
    };--end getData method

    getNext() : Node
    {
        next
    };

};--end class Node

--class List represents a linked list of employees
class List inherits Node 
{
    head: Node;--first node in the list
    nil: Node;--null pointer
    pr: Node;--for printing

    --constructor
    inti(h: Node): Node
    {
        {
            head <- h;
            self;
        }
    };

    addEmployee(n: Node): Object
    {
        {
            if (isvoid head) --if the is empty
            then 
            {
                head <- n;
                head.setData(n.getData());
                n.setNext(nil);
            }
            else
            {
                head <- n;
                head.setData(n.getData());
                n.setNext(head);
            }
            fi;
        }
    };-- end add method

    calculateBonus(): Object
    {
        {
            let e: Employee,
            bonus: Int,
            counter: Int <- 0 in
            {
                pr <- head;

                while
                    not(isvoid pr)
                loop
                {
                    e <- pr.getData();
                    if 5000 <= e.getSalary()
                    then 
                    {
                        out_string("\nBonus for");
                        out_string(e.getName());
                        out_string(": ");

                        bonus <- e.getSalary() + ((e.getSalary() * 20) / 100);
                        out_int(bonus);

                        pr <- pr.getNext();
                        counter <- counter + 1;
                    }
                    else
                    {
                        counter <- counter + 1;
                        pr <- pr.getNext();
                    }
                    fi;
                }
                pool;
                out_string("\n\n");
            };
        }
    };--end calculateBonus method

    
};




















class Main{
    main():Int{
    
        0
    };
};