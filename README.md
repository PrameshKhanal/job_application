General Robot Framework tests to verify the Job Application process.

For the tests to work, the variables.py file should be filled correctly and the correct files should be included in the 'Profile' folder unless the test is being executed using the incorrect file formats. The test can be run using various command line options. For example: 

robot -d results --include "job description" --variable BROWSER:chrome .\tests\new_application.robot

All logs, outputfiles and screeenshots will be added in the 'Results' folder. Results are not included here on purpose.

For the data driven testing, seperate robot file can be created. The existing keywords can be used as the test template.
