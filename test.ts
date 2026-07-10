
function brookes_law_efficiency(K: number, workers: number): number {
    const effectiveK = K / Math.pow(workers, 1/Math.E); // collision odds dilute with team size
    return workers/(1+effectiveK * workers * (workers-1)/2)
}

const mapping: {[key: string]: string} = {
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
}

function get_difficulty_message(difficulty: number): string {

    function get_difficulty_index() {
        const pointFive: string = (Math.round(difficulty * 2) / 2).toFixed(1);
        const recast_numeric: number = Number(pointFive)
        //console.log(recast_numeric)
        //console.log((Math.round(difficulty * 2 / 2)).toFixed(0))
        //console.log("point 5 is " + pointFive)

        if(recast_numeric >= 7) return "7.0"

        // needed otherwise it would round back to 4 and pass a check but have a string of 3.5
        else if (recast_numeric === 2.5) return "2.0"

        else if (recast_numeric >= 3) return pointFive
        else return (Math.round(difficulty * 2) / 2).toFixed(0);
    }

    return mapping[get_difficulty_index()]
}

function compute_lines(lines: number, quality: number, workers: number, teams: number, subsystems: number, subsystems_k: number, inner_team_k: number, outer_team_k: number): void {

    const clarity_to_randomness: number = Math.pow(Math.E,(1-quality))
    const workers_per_team = workers / teams

    if(teams === 0) teams = 1
 
    const worker_efficiency: number = brookes_law_efficiency(inner_team_k, workers_per_team)
    const efficiency_of_teams: number = brookes_law_efficiency(outer_team_k, teams)
    const efficiency_of_subsystems: number = brookes_law_efficiency(subsystems_k, subsystems)

    const line_difficulty = clarity_to_randomness * lines
    const overall_efficiency = worker_efficiency * efficiency_of_teams * efficiency_of_subsystems
    
    const inverse_miller_cowan = 1/6
    const difficulty = Math.pow((line_difficulty/overall_efficiency), inverse_miller_cowan)
    
    

    

    const msg = get_difficulty_message(difficulty)
    const msg_with_ai = get_difficulty_message(difficulty - 1)
    console.log(difficulty.toFixed(1) + " - " + msg)
    console.log("With AI: "+ msg_with_ai)
    console.log(" ")

    //console.log(clarity_to_randomness)
    //console.log(worker_efficiency)
}

compute_lines(16000, 0.5, 1, 1, 1, 0.33, 0, 0)
compute_lines(16000, 1, 1, 1, 4, 0.33, 0, 0)
compute_lines(40000000, 1, 2000, 200, 1700, 0.05, 0.10, 0.10)


