function brookes_law_efficiency(K, workers) {
    var effectiveK = K / Math.pow(workers, 1 / Math.E); // collision odds dilute with team size
    return workers / (1 + effectiveK * workers * (workers - 1) / 2);
}
var mapping = {
    "6.5": "MAX difficulty, nigh impossible to maintain -- in theory this should be abandoned",
    "6.0": "EXTREMELY hard, at the edge of what is possible to maintain, maximal experience required",
    "5.5": "Very Hard, at the higher end of what is achievable, you will need lots of experience",
    "5.0": "Hard for most, but doable, likely will need some experienced staff",
    "4.5": "Modest difficulty for experienced devs, more junior ones might struggle",
    "4.0": "Moderately low difficulty, most developers will find this pretty straight forward",
    "3.5": "Lower difficulty, wont pose much of a challenge",
    "3.0": "Easy for anyone in professional development, lightning fast to learn",
    "2.0": "Trivial, even for junior developers, not even that hard for an absolute beginner",
    "1.0": "More Trivial than Trivial, you could teach someone off the street how it works"
};
function get_difficulty_message(difficulty) {
    function get_difficulty_index() {
        var pointFive = (Math.round(difficulty * 2) / 2).toFixed(1);
        var recast_numeric = Number(pointFive);
        //console.log(recast_numeric)
        //console.log((Math.round(difficulty * 2 / 2)).toFixed(0))
        //console.log("point 5 is " + pointFive)
        if (recast_numeric >= 7)
            return "6.5";
        // needed otherwise it would round back to 4 and pass a check but have a string of 3.5
        else if (recast_numeric === 2.5)
            return "2.0";
        else if (recast_numeric >= 3)
            return pointFive;
        else
            return (Math.round(difficulty * 2) / 2).toFixed(0);
    }
    return mapping[get_difficulty_index()];
}
function compute_lines(lines, quality, workers, teams, subsystems, subsystems_k, inner_team_k, outer_team_k) {
    //const clarity_to_randomness: number = Math.pow(Math.E,(1-quality))
    var workers_per_team = workers / teams;
    if (teams === 0)
        teams = 1;
    var worker_efficiency = brookes_law_efficiency(inner_team_k, workers_per_team);
    var efficiency_of_teams = brookes_law_efficiency(outer_team_k, teams);
    var efficiency_of_subsystems = brookes_law_efficiency(Math.pow(subsystems, (1 / Math.E)), subsystems);
    console.log("\n--- Total Efficiency Multiplier: ---");
    console.log("inner team efficiency: ".concat(worker_efficiency.toFixed(1), "x"));
    console.log("outer team efficiency: ".concat(efficiency_of_teams.toFixed(1), "x"));
    console.log("subsys efficiency: ".concat(efficiency_of_subsystems.toFixed(1), "x"));
    var line_difficulty = Math.pow(lines);
    var net_efficiency = worker_efficiency * efficiency_of_teams * efficiency_of_subsystems;
    console.log(" -> NET Eff.: ".concat(net_efficiency.toFixed(1), "x"));
    console.log(" -> Line Difficulty: ".concat(line_difficulty, " due to Quality ").concat(quality));
    var inverse_miller_cowan = 1 / 6;
    var difficulty = Math.pow((line_difficulty / net_efficiency), inverse_miller_cowan);
    var msg = get_difficulty_message(difficulty);
    var msg_with_ai = get_difficulty_message(difficulty - 1);
    console.log("".concat(difficulty.toFixed(2), "/6 - ").concat(msg));
    console.log("With AI: " + msg_with_ai);
    //console.log(clarity_to_randomness)
    //console.log(worker_efficiency)
}
function cleanliness(lines, workers, worker_k, dirtyness, projects) {
    if (projects === void 0) { projects = 1; }
    var effective_difficulty = Math.pow(lines, 1 + dirtyness / 100 * Math.E);
    console.log("effective difficulty is ", effective_difficulty);
    return effective_difficulty;
}
// tsc test.ts && node test.js
//cleanliness(20000,1,1,10,1)
var MINIMUM_COMPREHENSION = 1 / Math.pow(6, 6);
console.log(MINIMUM_COMPREHENSION);
compute_lines(19000, 0.66, 1, 1, 1, 0, 0, 0);
compute_lines(19000, 0.66, 1, 1, 2, 0.10, 0, 0);
//compute_lines(16_000, 1, 9, 3, 1, 0.001, 0, 0)
//compute_lines(40_000_000, 1, 2000, 200, 35, 0.01, 0.01, 0.01)
