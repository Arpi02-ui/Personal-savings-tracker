// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PersonalSavingsTracker {
    // Struct to store savings goal details
    struct SavingsGoal {
        address owner;
        string name;
        uint256 targetAmount;
        uint256 currentAmount;
        uint256 deadline;
        bool completed;
        uint256 rewardPoints;
    }

    // Mapping to store savings goals for each user
    mapping(address => SavingsGoal[]) public userSavingsGoals;

    // Mapping to track total reward points for each user
    mapping(address => uint256) public userRewardPoints;

    // Events to log important actions
    event GoalCreated(address indexed user, string name, uint256 targetAmount, uint256 deadline);
    event SavingDeposited(address indexed user, uint256 goalIndex, uint256 amount);
    event GoalCompleted(address indexed user, uint256 goalIndex, uint256 rewardPointsEarned);

    // Create a new savings goal
    function createSavingsGoal(
        string memory _name, 
        uint256 _targetAmount, 
        uint256 _deadlineInDays
    ) external {
        require(_targetAmount > 0, "Target amount must be greater than 0");
        require(_deadlineInDays > 0, "Deadline must be in the future");

        SavingsGoal memory newGoal = SavingsGoal({
            owner: msg.sender,
            name: _name,
            targetAmount: _targetAmount,
            currentAmount: 0,
            deadline: block.timestamp + (_deadlineInDays * 1 days),
            completed: false,
            rewardPoints: 0
        });

        userSavingsGoals[msg.sender].push(newGoal);

        emit GoalCreated(msg.sender, _name, _targetAmount, newGoal.deadline);
    }

    // Deposit funds towards a specific savings goal
    function depositToGoal(uint256 _goalIndex) external payable {
        require(_goalIndex < userSavingsGoals[msg.sender].length, "Invalid goal index");
        
        SavingsGoal storage goal = userSavingsGoals[msg.sender][_goalIndex];
        require(!goal.completed, "Goal already completed");
        require(block.timestamp <= goal.deadline, "Goal deadline has passed");

        goal.currentAmount += msg.value;

        emit SavingDeposited(msg.sender, _goalIndex, msg.value);

        // Check if goal is completed
        if (goal.currentAmount >= goal.targetAmount) {
            _completeGoal(_goalIndex);
        }
    }

    // Internal function to complete a goal and award reward points
    function _completeGoal(uint256 _goalIndex) internal {
        SavingsGoal storage goal = userSavingsGoals[msg.sender][_goalIndex];
        
        // Mark goal as completed
        goal.completed = true;

        // Calculate reward points based on completion and time
        uint256 rewardPoints = _calculateRewardPoints(goal);
        goal.rewardPoints = rewardPoints;
        userRewardPoints[msg.sender] += rewardPoints;

        emit GoalCompleted(msg.sender, _goalIndex, rewardPoints);
    }

    // Calculate reward points based on goal completion
    function _calculateRewardPoints(SavingsGoal memory _goal) internal view returns (uint256) {
        // Base points for completing the goal
        uint256 basePoints = 100;

        // Bonus points for early completion
        if (block.timestamp < _goal.deadline) {
            uint256 timeLeftPercentage = ((_goal.deadline - block.timestamp) * 100) / (_goal.deadline - block.timestamp);
            basePoints += (timeLeftPercentage / 10); // Bonus up to 10% extra points
        }

        // Scaling points based on goal amount
        uint256 scaleFactor = (_goal.targetAmount / 1 ether) * 10;
        return basePoints + scaleFactor;
    }

    // Retrieve user's savings goals
    function getUserSavingsGoals() external view returns (SavingsGoal[] memory) {
        return userSavingsGoals[msg.sender];
    }

    // Get total reward points for the user
    function getUserRewardPoints() external view returns (uint256) {
        return userRewardPoints[msg.sender];
    }

    // Withdraw completed goal funds
    function withdrawCompletedGoalFunds(uint256 _goalIndex) external {
        require(_goalIndex < userSavingsGoals[msg.sender].length, "Invalid goal index");
        
        SavingsGoal storage goal = userSavingsGoals[msg.sender][_goalIndex];
        require(goal.completed, "Goal not completed");
        require(goal.currentAmount > 0, "No funds to withdraw");

        uint256 amount = goal.currentAmount;
        goal.currentAmount = 0;

        // Transfer funds back to the user
        payable(msg.sender).transfer(amount);
    }
}