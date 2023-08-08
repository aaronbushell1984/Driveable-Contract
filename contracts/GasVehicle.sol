pragma solidity >=0.4.22 <=0.8.17;

import "./iDriveable.sol";

abstract contract GasVehicle is Driveable {

    bool running;
    uint fuelRemaining;
    uint fuelTankSize;
    uint kilometersPerLitre;

    modifier mustNotBeRunnning() {
        require(!running, "engine must not be runnning");
        _;
    }

    modifier mustBeRunning() {
        require(running, "engine must be running");
        _;
    }

    modifier mustBeSpaceInTank(uint litres) {
        require(litres <= (fuelTankSize - fuelRemaining), "too much fuel for tank size");
        _;
    }

    modifier mustBeFuelForJourney(uint kilometers) {
        require(fuelRemaining * kilometersPerLitre >= kilometers, "not enough fuel");
        _;
    }

    function getKilometersPerLitre() public view virtual returns (uint);

    function getFuelCapacity() public view virtual returns (uint);


    function startEngine() external override {
        running = true;
    }

    function stopEngine() external override {
        running = false;
    }

    function fuelUp(uint litres) external override mustNotBeRunnning() mustBeSpaceInTank(litres) {
        fuelRemaining += litres;
    }

    function drive(uint kilometers) external override mustBeRunning() mustBeFuelForJourney(kilometers) {
        fuelRemaining -= (kilometers / kilometersPerLitre);
    }

    function kilometersRemaining() external view override returns (uint) {
        return fuelRemaining * kilometersPerLitre;
    }

}