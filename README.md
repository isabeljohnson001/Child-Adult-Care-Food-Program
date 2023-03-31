<h1 align="center">Child-Adult-Care-Food-Program</h1>
The Child and Adult Care Food Program (CACFP) is a federal program that provides reimbursements for nutritious meals and snacks to eligible children and adults who are enrolled for care at participating childcare centers, daycare homes, and adult daycare centers. We will be applying different data mining techniques to the data set provided and mine the data and determine which characteristics are useful to determine the reimbursement amount received and meal participation rates.

<h3>General Overview of the dataset</h3>
The data came from the Texas Open Data Portal, which is constantly updated with the latest and most relevant data, where the latest update was as of March 11, 2023. The dataset contains 1558 observations of 65 variables.   
<br/>
Dataset can be found under :-
<br/>
https://data.texas.gov/dataset/Child-and-Adult-Care-Food-Programs-CACFP-Adult-Day/r4up-szqn

<h3>Data Cleaning</h3>
The first stage in our study was to make sure the dataset was of good quality. To ensure the dataset's quality for our study, we first explored the data to understand its columns and content. The dataset consisted of 65 columns and 1558 rows, containing both numerical and categorical data. We identified missing values in the dataset that were related to child participation and numerical in nature. Based on the documentation from the reference site, we replaced the missing values with 0 to ensure the data's consistency and accuracy.  
<br/>

<h3> Data Analysis and Visualizations</h3>
<p>
 <img src="https://github.com/isabeljohnson001/Child-Adult-Care-Food-Program/blob/052c83133057988da29795a56b4da6bcc5969ece/counties_breakfast_adp.png" width="500"/>
 </br>
 <img src="https://github.com/isabeljohnson001/Child-Adult-Care-Food-Program/blob/447db79e1a9c8880a92995cd4d52878b273bb3a2/trend_reimbursement.png" width="500"/>
 <img src="https://github.com/isabeljohnson001/Child-Adult-Care-Food-Program/blob/447db79e1a9c8880a92995cd4d52878b273bb3a2/trend_mealserved.png" width="500"/>
 <br/>
 <img src="https://github.com/isabeljohnson001/Child-Adult-Care-Food-Program/blob/a46b0207f6f6510d66a533b50ba7fa6baebd2b88/meals_sum.png" width="500"/>
 </br>
 <p>
<b>Building decision tree for Total Reimbursement Received.</b>
 </br>
<img src="https://github.com/isabeljohnson001/Child-Adult-Care-Food-Program/blob/052c83133057988da29795a56b4da6bcc5969ece/tree_reimbur.png" width="500"/>
</br>
<b>Building decision tree for Meal Participation Rates.</b>
 </br>
<img src="https://github.com/isabeljohnson001/Child-Adult-Care-Food-Program/blob/052c83133057988da29795a56b4da6bcc5969ece/tree_meal_participation.png" width="500"/>
 <br/>
 
<h3> Insights and Recommendations</h3>
<b>Insights</b>
&emsp;<li>Average daily attendance (ADP) is higher for breakfast and lunch than for other meals. Lubbock has the highest ADP for all meals, while Bowie, Victoria, and San Jacinto have the lowest attendance rates.
</br>
&emsp;<li>There is no clear trend or pattern in the number of meals served or reimbursement amounts over time.
</br>
&emsp;<li>For-profit organizations have a higher mean meal participation rate and reimbursement amount than non-profit organizations.
</br>
&emsp;<li>The analysis used multiple regression analysis and decision tree modeling to identify predictors of total reimbursement for school meals. Model 1 used all available predictors to identify important features, which were then used in Model 2 to create a decision tree model. The decision tree showed that the most important predictor was "LunchServedFree", and schools with higher values of this variable tended to have higher predicted outcomes. Additionally, "LunchTotal" played a role in predicting outcomes for schools with high levels of "LunchServedFree". The accuracy of the model on the testing data was high, indicating that it is a good fit for predicting Total Reimbursement values for new instances. Overall, the analysis suggests that schools providing more free and total lunches tend to receive higher reimbursements.
</br>
&emsp;<li>Decision tree is built for predicting Total Meal Participation rates using multiple linear regression analysis to identify significant predictor variables. The decision tree analysis shows that LunchADP is the most important variable in predicting meal participation rates. The model confirms the positive correlation between lunch and breakfast participation rates. The model accurately predicts the Meal Participation rate with an accuracy of 0.9648. The analysis suggests that schools with lower average daily participation in lunch are more likely to have lower participation rates in both lunch and breakfast. This may indicate that efforts to increase lunch participation rates could have a positive spillover effect on breakfast participation rates.
</br>
&emsp;<li>The analysis used a decision tree and multiple linear regression to identify predictor variables for meal participation rates in schools. The results showed that LunchADP was the most important variable in predicting meal participation rates, and there was a positive correlation between lunch and breakfast participation rates. The model accurately predicted meal participation rates with a high level of accuracy. 
</br>
&emsp;<li>The analysis also found that schools with lower lunch participation rates were more likely to have lower participation rates in both lunch and breakfast, suggesting that increasing lunch participation rates could have a positive impact on breakfast participation rates. Additionally, the relationship between breakfast and lunch participation rates was found to depend on the level of LunchADP. For schools with higher LunchADP, increasing lunch participation rates could lead to higher breakfast participation rates. However, for schools with lower LunchADP, higher breakfast participation rates were observed when lunch participation rates were lower. Therefore, the intervention strategies to increase participation rates in both meals should be tailored depending on the level of LunchADP.
</br>
<b>Recommendations</b>
Based on the insights gained from the data analysis and modeling, below are some recommendations:
</br>
&emsp;<li>Prioritize increasing participation rates in lunch: The analysis shows that LunchADP is the most important predictor of meal participation rates. Therefore, schools should prioritize increasing lunch participation rates to have a positive spillover effect on breakfast participation rates.
</br>
&emsp;<li>Focus on providing free lunches: Schools should also focus on providing more free and total lunches as it was found to be a significant predictor of total reimbursement. For-profit organizations should be encouraged to provide more free and total lunches to increase meal participation rates and reimbursement amounts.
</br>
&emsp;<li>Target schools with low participation rates: Schools with lower average daily participation in lunch tend to have lower overall meal participation rates. Therefore, interventions should be targeted towards these schools to increase participation rates. 
</br>
&emsp;<li>Consider implementing a Breakfast After the Bell program: Given that breakfast and lunch have higher ADP than other meals, schools could consider implementing this program where breakfast is served after the first bell and incorporated into the school day, can help increase breakfast participation rates among students who may otherwise skip breakfast.
</br>
&emsp;<li>Incorporate additional variables in future analyses: Future analyses could consider incorporating variables such as school demographics, meal quality, and school policies related to meal programs. These variables could provide additional insights into factors that influence meal participation rates and inform the development of more effective intervention strategies. 
</br>
&emsp;<li>Consider the organizational structure of meal providers: The analysis showed that for-profit organizations had higher mean meal participation rates and reimbursement amounts than non-profit organizations. Future analyses could consider the organizational structure of meal providers as a variable to investigate its impact on meal participation rates and reimbursement amounts.
</br>
<h3>Conclusions</h3>
<p>
In conclusion, The analysis of school meal participation data has provided several recommendations to increase meal participation rates in schools. Breakfast and lunch have higher average daily attendance rates than other meals, and Lubbock has the highest attendance rates while Bowie, Victoria, and San Jacinto have the lowest attendance rates. For-profit organizations have a higher mean meal participation rate and reimbursement amount than non-profit organizations. The decision tree model showed that LunchServedFree is the most important predictor of total reimbursement for school meals. Schools with low participation rates in lunch are more likely to have lower participation rates in both lunch and breakfast, making increasing participation in lunch a priority. Increasing awareness of the importance of breakfast and monitoring the impact of meal reimbursements can improve participation rates. Tailored intervention strategies should be implemented based on lunch's average daily participation rate. Implementing a breakfast-after-the-bell program can increase breakfast participation rates among students who may otherwise skip breakfast. Ultimately, these recommendations aim to improve academic success and overall well-being by ensuring students have access to nutritious meals.
<p>


-----
