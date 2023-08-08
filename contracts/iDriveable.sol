pragma solidity >=0.4.22 <=0.8.17;

interface Driveable {

    function startEngine() external;

    function stopEngine() external;

    function fuelUp(uint litres) external;

    function drive(uint kilometers) external;

    function kilometersRemaining() external view returns (uint);

}