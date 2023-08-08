pragma solidity >=0.4.22 <=0.8.17;

import "./GasVehicle.sol";

contract Car is GasVehicle {

    constructor(uint _fuelTankSize, uint _kilometersPerLitre) {
        fuelTankSize = _fuelTankSize;
        kilometersPerLitre = _kilometersPerLitre;
    }

    function getKilometersPerLitre() public view override returns (uint) {
        return kilometersPerLitre;
    }

    function getFuelCapacity() public view override returns (uint) {
        return fuelTankSize;
    }
}