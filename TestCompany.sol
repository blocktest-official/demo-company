pragma solidity 0.4.25;

import "./Company.sol";

contract TestCompany is Company {
    
    function testAddEmployee () public {
        address employee = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
        if (isEmployee[employee]) {
            isEmployee[employee] = false;
        }
        addEmployee(employee);
        assert(isEmployee[employee]);
    }
    
    function testLogHour() public {
        address employee = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
        if (isEmployee[employee]){
            uint totalHours = getHoursLogged(employee);
            logHour(employee, 2);
            assert(getHoursLogged(employee) == totalHours + 2);
        }
        else{
            addEmployee(employee);
            uint totalHourss = getHoursLogged(employee);
            logHour(employee, 2);
            assert(getHoursLogged(employee) == totalHourss + 2);
        }   
        
    }
    
    function testGetHoursLogged () public {
        address employee = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
        if (isEmployee[employee]){
            uint totalHours = getHoursLogged(employee);
            logHour(employee, 2);
            assert(getHoursLogged(employee) == totalHours + 2);
        }
        else{
            addEmployee(employee);
            uint totalHourss = getHoursLogged(employee);
            logHour(employee, 2);
            assert(getHoursLogged(employee) == totalHourss + 2);
        }
    }
}
