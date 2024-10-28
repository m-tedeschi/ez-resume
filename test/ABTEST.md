# A/B Test 1: Increase Resume Completion Rate
  User Story 4

  Metric: Net Promoter Score to see how smooth and engaging our UI is 

  ## Hypothesis
  Many users begin the resume creation process in the EZ Resume App but do not complete it, resulting in a low conversion rate for completed resume downloads. Based on          user feedback and tracking data, we observed that most drop-offs occur after users select a template and before they reach the final “Download” step. This suggests users     may be overwhelmed by the interface or unclear about how close they are to finishing. This low completion rate impacts the app's effectiveness and the perceived value to     users, who may feel frustrated or uncertain about the process. Increasing resume download completion will enhance user satisfaction and demonstrate the app’s value by      helping users complete the intended task more efficiently.

  ## Experiment
  We will allocate 50% of our user base to the experiment, with 25% in the control group (existing layout) and 25% in the treatment group (step-by-step layout with progress    indicator). This split ensures we maintain a sufficiently large control group while still gathering meaningful insights on user behavior in the treatment group. A 50/50      split ensures statistical significance, providing a clear comparison of user behavior between the two groups without compromising user experience.

  Firebase Capabilities Utilized
  Firebase Remote Config: This will be used to toggle between the control and treatment group interfaces in real-time, making it easy to deploy the A/B test without            requiring a new app version release.
  
  Firebase A/B Testing: Leverages Firebase’s built-in capabilities to manage and track the experiment, ensuring that variations are tested accurately and results are           presented in a statistically valid format.
  
  Firebase Analytics: Used to track user engagement and completion metrics, allowing us to determine the impact of the experiment on user behavior.

  ## Variation
  Variation 1: Control (Existing Design)
  Design: The current design displays all form fields in a single, scrollable page format, with no progress indicator.
  CTA Placement: The "Download Resume" button is placed at the end of the form, which users can only see once they complete all fields.
  Potential Issues: Users may feel overwhelmed by the number of fields presented at once and may abandon the process due to a lack of feedback on their progress.
