pragma solidity ^0.4.21;

contract Registry {
    
    // address emptyAddress = 0x0000000000000000000000000000000000000000;
    mapping(address => DropBox) emptyMap;
    
    struct DropBox {
        address charity;
        address operator;
        address owner;
        string location;
        string time;
        uint balance;
        bool isSet;
    }

    struct Charity {
        string name;
        uint charityNumber;
        bool isSet;
        mapping(address => DropBox) boxMap;
    }

    struct Operator {
        string name;
        uint phoneNumber;
        string operatorType;
        bool isSet;
        mapping(address => DropBox) boxMap;
    }

    struct Owner {
        string name;
        string location;
        bool isSet;
    }

    mapping(address => DropBox) public boxMap;
    mapping(address => Charity) public charityMap;
    mapping(address => Operator) public operatorMap;
    mapping(address => Owner) public ownerMap;

    // constructor
    function Registry() public {
        createDropBox("test box", "1800 McGill College", 0xca35b7d915458ef540ade6068dfe2f44e8fa733c);
        createCharity("test charity", 12345);
        createOperator("test operator", 5141234567, "authorized personel");
        createOwner("test owner", "1800 McGill College");
        setCharity(0xca35b7d915458ef540ade6068dfe2f44e8fa733c);
        setOperator(0xca35b7d915458ef540ade6068dfe2f44e8fa733c);
        setOwner(0xca35b7d915458ef540ade6068dfe2f44e8fa733c);
    }

    /* public flow */
    
    function donate (address dropBoxAddress) payable public returns (bool) {
        if(boxMap[dropBoxAddress].isSet) {
            boxMap[dropBoxAddress].balance += msg.value;
            return false;
        }
        
        return true;
    }
    
    function withdraw (address dropBoxAddress) public returns (bool) {
        if(boxMap[dropBoxAddress].isSet) {
            DropBox memory dropBox = boxMap[dropBoxAddress];
            if ((charityMap[msg.sender].isSet && dropBox.charity == msg.sender) 
                || (operatorMap[msg.sender].isSet && dropBox.operator == msg.sender)) {
                
                address receiver = msg.sender;
                uint amount = dropBox.balance;
                receiver.transfer(amount);
                boxMap[dropBoxAddress].balance = 0;
                return true;
            } else {
                return false;
            }
        }
    }

    function createDropBox (
        string location,
        string time,
        address dropBoxAddress) public returns (bool) {
            
        DropBox memory dropBox = DropBox (
            {
            charity: address(0),
            operator: address(0),
            owner: address(0),
            location: location,
            time: time,
            balance: 0,
            isSet: true
            }
        );
        boxMap[dropBoxAddress] = dropBox;
        return true;
    }

    function createCharity (string name, uint charityNumber) public returns (bool) {
        
        charityMap[msg.sender] = Charity (
            {
            name: name,
            charityNumber: charityNumber,
            isSet: true
            }
        );
        return true;
    }
    
    function createOperator (
        string name,
        uint phoneNumber,
        string operatorType) public returns (bool)  {

        operatorMap[msg.sender] = Operator (
            {
            name: name,
            phoneNumber: phoneNumber,
            operatorType: operatorType,
            isSet: true
            }
        );
        
        return true;
    }

    function createOwner (string name, string location) public returns (bool) {

        ownerMap[msg.sender] = Owner (
            {
            name: name,
            location: location,
            isSet: true
            }
        );
        
        return true;
    }
    
    function setCharity (address dropBoxAddress) public returns (bool) {
        // check drop box and charity exist and drop box currently has no associated charity
        if (boxMap[dropBoxAddress].isSet
        && charityMap[msg.sender].isSet
        && (boxMap[dropBoxAddress].charity == 0)) {
            boxMap[dropBoxAddress].charity = msg.sender;
            return true;
        }
        return false;
    }
    
    function setOperator (address dropBoxAddress) public returns (bool) {
        // check drop box and operator exist and drop box currently has no associated operator
        if (boxMap[dropBoxAddress].isSet
        && operatorMap[msg.sender].isSet
        && (boxMap[dropBoxAddress].operator == 0)) {
            boxMap[dropBoxAddress].operator = msg.sender;
            return true;
        }
        return false;
    }
    
    function setOwner (address dropBoxAddress) public returns (bool) {
        // check drop box and owner exist and drop box currently has no associated owner
        if (boxMap[dropBoxAddress].isSet
        && ownerMap[msg.sender].isSet
        && (boxMap[dropBoxAddress].owner == 0)) {
            boxMap[dropBoxAddress].owner = msg.sender;
            return true;
        }
        return false;
    }
    
    function changeLocation (address dropBoxAddress, string location) public returns (bool) {
        boxMap[dropBoxAddress].location = location;
        return true;
    }
    
    function changeTime (address dropBoxAddress, string time) public returns (bool) {
        boxMap[dropBoxAddress].time = time;
        return true;
    }

    function charityUnregisterBox (address charityAddress, address dropBoxAddress) public returns (bool) {
        delete charityMap[charityAddress].boxMap[dropBoxAddress];
        delete boxMap[dropBoxAddress].charity;
        return true;
    }
    
    function operatorUnregisterBox (address operatorAddress, address dropBoxAddress) public returns (bool) {
        delete operatorMap[operatorAddress].boxMap[dropBoxAddress];
        delete boxMap[dropBoxAddress].operator;
        return true;
    }

    function ownerUnregisterBox (address ownerAddress, address dropBoxAddress) public returns (bool) {
        delete boxMap[dropBoxAddress].owner;
        return true;
    }
    
    function deleteDropBox (address dropBoxAddress) public returns (bool) {
        delete boxMap[dropBoxAddress];
        return true;
    }
    
    function deleteCharity (address charityAddress) public returns (bool) {
        delete charityMap[charityAddress];
        return true;
    }
    
    function deleteOperator (address operatorAddress) public returns (bool) {
        delete operatorMap[operatorAddress];
        return true;
    }
    
    function deleteOwner (address ownerAddress) public returns (bool) {
        delete ownerMap[ownerAddress];
        return true;
    }    

    // function notifyCharity(address charityAddress, string message) private {
    // 
    // }
   
}