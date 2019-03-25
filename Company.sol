
pragma solidity 0.4.25;

contract Company {

    address owner;

    constructor() public {
        owner = msg.sender;
        isEmployee[msg.sender] = true;
    }

    mapping(address => bool) public isEmployee;
    mapping(address => uint) private employeeToHoursWorked;

    function addEmployee (address _employee) public {
        require(msg.sender == owner, "Adding Denied");
        isEmployee[_employee] = true;
    }

    function getHoursLogged (address _employee) public view returns (uint) {
        require(msg.sender == owner || msg.sender == _employee, "Log Denied");
        return employeeToHoursWorked[_employee];
    }

    function logHour(address _employee, uint _hour) public {
        require(isEmployee[_employee], "Log Failed, Not an Employee");
        employeeToHoursWorked[_employee] += _hour;
    }
    
}
