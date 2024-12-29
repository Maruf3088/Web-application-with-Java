<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TER Submission</title>
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }

        .container {
            max-width: 1100px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }



       .container  h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #00B2FF;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #00B2FF;
            color: white;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #c8edf3;
        }



        .custom-radio input {
            display: none;
        }

        .custom-radio label {
            display: inline-block;
            width: 25px;
            height: 25px;
            background-color: #ddd;
            border-radius: 50%;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .custom-radio input:checked + label {
            background-color: #00B2FF;
        }

        .custom-radio label:hover {
            background-color: #bbb;
        }

        .button-container {
            margin-top: 20px;
            text-align: center;
        }

        button {
            padding: 10px 20px;
            margin-right: 10px;
            background-color: #00B2FF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #00B2FF;
        }

        #terResultTable {
            margin-top: 30px;
            width: 100%;
            border-collapse: collapse;
            display: none;
        }

        #terResultTable th, #terResultTable td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        #terResultTable th {
            background-color: #00B2FF;
            color: white;
        }
    </style>
    <script>
        function calculateTER() {
            const rows = document.querySelectorAll("tbody tr");
            let totalScore = 0;

            rows.forEach(row => {
                const selected = row.querySelector("input[type='radio']:checked");
                if (selected) {
                    totalScore += parseInt(selected.value);
                }
            });

            const resultTable = document.getElementById("terResultTable");
            const scoreCell = document.getElementById("terScore");
            const commentCell = document.getElementById("terComment");

            scoreCell.innerText = totalScore;

            if (totalScore >= 80) {
                commentCell.innerText = "Excellent performance! Keep up the great work.";
            } else if (totalScore >= 50) {
                commentCell.innerText = "Good, but there's room for improvement.";
            } else {
                commentCell.innerText = "Needs significant improvement.";
            }

            resultTable.style.display = "table";
        }
    </script>
</head>
<body>



<div class="container">
    <div><%@ include file="/WEB-INF/includes/navbar.jsp" %></div>
    <h1 class="mt-4 fw-bold">TER Submission</h1>

    <!-- Teacher details -->
    <table>
        <thead>
        <tr>
            <th>Teacher Name</th>
            <th>Department</th>
            <th>Course</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="fw-bold">${teacher.name}</td>
            <td class="fw-bold">${teacher.department}</td>
            <td class="fw-bold">${teacher.course}</td>
        </tr>
        </tbody>
    </table>

    <!-- TER form -->
    <form action="submit-ter" method="POST">
        <table>
            <thead>
            <tr>
                <th>Quality</th>
                <th>Very Bad</th>
                <th>Bad</th>
                <th>Good</th>
                <th>Excellent</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Communication Skills</td>
                <td class="custom-radio"><input type="radio" name="communication" value="0" id="comm1" required><label for="comm1"></label></td>
                <td class="custom-radio"><input type="radio" name="communication" value="2" id="comm2"><label for="comm2"></label></td>
                <td class="custom-radio"><input type="radio" name="communication" value="5" id="comm3"><label for="comm3"></label></td>
                <td class="custom-radio"><input type="radio" name="communication" value="10" id="comm4"><label for="comm4"></label></td>
            </tr>
            <tr>
                <td>Subject Knowledge</td>
                <td class="custom-radio"><input type="radio" name="knowledge" value="0" id="know1" required><label for="know1"></label></td>
                <td class="custom-radio"><input type="radio" name="knowledge" value="2" id="know2"><label for="know2"></label></td>
                <td class="custom-radio"><input type="radio" name="knowledge" value="5" id="know3"><label for="know3"></label></td>
                <td class="custom-radio"><input type="radio" name="knowledge" value="10" id="know4"><label for="know4"></label></td>
            </tr>
            <!-- Add remaining 8 rows similarly -->
            <tr>
                <td>Classroom Management</td>
                <td class="custom-radio"><input type="radio" name="management" value="0" id="manage1" required><label for="manage1"></label></td>
                <td class="custom-radio"><input type="radio" name="management" value="2" id="manage2"><label for="manage2"></label></td>
                <td class="custom-radio"><input type="radio" name="management" value="5" id="manage3"><label for="manage3"></label></td>
                <td class="custom-radio"><input type="radio" name="management" value="10" id="manage4"><label for="manage4"></label></td>
            </tr>
            <tr>
                <td>Punctuality</td>
                <td class="custom-radio"><input type="radio" name="punctuality" value="0" id="punct1" required><label for="punct1"></label></td>
                <td class="custom-radio"><input type="radio" name="punctuality" value="2" id="punct2"><label for="punct2"></label></td>
                <td class="custom-radio"><input type="radio" name="punctuality" value="5" id="punct3"><label for="punct3"></label></td>
                <td class="custom-radio"><input type="radio" name="punctuality" value="10" id="punct4"><label for="punct4"></label></td>
            </tr>
            <tr>
                <td>Teaching Methods</td>
                <td class="custom-radio"><input type="radio" name="teaching" value="0" id="teach1" required><label for="teach1"></label></td>
                <td class="custom-radio"><input type="radio" name="teaching" value="2" id="teach2"><label for="teach2"></label></td>
                <td class="custom-radio"><input type="radio" name="teaching" value="5" id="teach3"><label for="teach3"></label></td>
                <td class="custom-radio"><input type="radio" name="teaching" value="10" id="teach4"><label for="teach4"></label></td>
            </tr>
            <tr>
                <td>Student Engagement</td>
                <td class="custom-radio"><input type="radio" name="engagement" value="0" id="engage1" required><label for="engage1"></label></td>
                <td class="custom-radio"><input type="radio" name="engagement" value="2" id="engage2"><label for="engage2"></label></td>
                <td class="custom-radio"><input type="radio" name="engagement" value="5" id="engage3"><label for="engage3"></label></td>
                <td class="custom-radio"><input type="radio" name="engagement" value="10" id="engage4"><label for="engage4"></label></td>
            </tr>
            <tr>
                <td>Problem Solving</td>
                <td class="custom-radio"><input type="radio" name="problemSolving" value="0" id="solve1" required><label for="solve1"></label></td>
                <td class="custom-radio"><input type="radio" name="problemSolving" value="2" id="solve2"><label for="solve2"></label></td>
                <td class="custom-radio"><input type="radio" name="problemSolving" value="5" id="solve3"><label for="solve3"></label></td>
                <td class="custom-radio"><input type="radio" name="problemSolving" value="10" id="solve4"><label for="solve4"></label></td>
            </tr>
            <tr>
                <td>Respect Towards Students</td>
                <td class="custom-radio"><input type="radio" name="respect" value="0" id="respect1" required><label for="respect1"></label></td>
                <td class="custom-radio"><input type="radio" name="respect" value="2" id="respect2"><label for="respect2"></label></td>
                <td class="custom-radio"><input type="radio" name="respect" value="5" id="respect3"><label for="respect3"></label></td>
                <td class="custom-radio"><input type="radio" name="respect" value="10" id="respect4"><label for="respect4"></label></td>
            </tr>
            <tr>
                <td>Use of Technology</td>
                <td class="custom-radio"><input type="radio" name="technology" value="0" id="tech1" required><label for="tech1"></label></td>
                <td class="custom-radio"><input type="radio" name="technology" value="2" id="tech2"><label for="tech2"></label></td>
                <td class="custom-radio"><input type="radio" name="technology" value="5" id="tech3"><label for="tech3"></label></td>
                <td class="custom-radio"><input type="radio" name="technology" value="10" id="tech4"><label for="tech4"></label></td>
            </tr>
            <tr>
                <td>Encouraging Creativity</td>
                <td class="custom-radio"><input type="radio" name="creativity" value="0" id="creative1" required><label for="creative1"></label></td>
                <td class="custom-radio"><input type="radio" name="creativity" value="2" id="creative2"><label for="creative2"></label></td>
                <td class="custom-radio"><input type="radio" name="creativity" value="5" id="creative3"><label for="creative3"></label></td>
                <td class="custom-radio"><input type="radio" name="creativity" value="10" id="creative4"><label for="creative4"></label></td>
            </tr>

            </tbody>
        </table>

        <!-- Calculate TER and Submit buttons -->
        <div class="button-container">
            <button type="button" onclick="calculateTER()">Calculate TER</button>
            <button type="submit">Submit</button>
        </div>
    </form>

    <!-- Display TER result -->
    <table id="terResultTable">
        <thead>
        <tr>
            <th>TER Score</th>
            <th>Comments</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="fw-bold" id="terScore">0</td>
            <td class="fw-bold" id="terComment">-</td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>
