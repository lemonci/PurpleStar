addpath('src/Algorithms/')
addpath('src/Measures/')
addpath('orca/PurpleStar/')
load '/home/lemonci/orca/PurpleStar/train18.0'
load '/home/lemonci/orca/PurpleStar/test18.0'
train.patterns = train18(:,1:(size(train18,2)-1));
train.targets = train18(:,size(train18,2));
test.patterns = test18(:,1:(size(test18,2)-1));
test.targets = test18(:,size(test18,2));
>> SVRAlgorithem = SVR();
>> info = SVRAlgorithem.fitpredict(train,test);
>> MAE.calculateMetric(info.predictedTest,test.targets)
ans =  3.6592
>> KDLORAlgorithem = KDLOR();
>> info = KDLORAlgorithem.fitpredict(train,test);
>> MAE.calculateMetric(info.predictedTest,test.targets)
ans =  3.9154
>> CSSVCAlgorithem = CSSVC();
>> info = CSSVCAlgorithem.fitpredict(train,test);
>> MAE.calculateMetric(info.predictedTest,test.targets)
ans =  4.8930
>> SVMOPAlgorithem = SVMOP();
>> info = SVMOPAlgorithem.fitpredict(train,test);
>> MAE.calculateMetric(info.predictedTest,test.targets)
ans =  4.2455
>> ELMOPAlgorithem = ELMOP();
>> info = ELMOPAlgorithem.fitpredict(train,test);
>> MAE.calculateMetric(info.predictedTest,test.targets)
\ans =  4.0428
>> POMAlgorithem = POM();
>> info = POMAlgorithem.fitpredict(train,test);
warning: matrix singular to machine precision
warning: called from
    logistic_regression at line 130 column 3
    privfit at line 81 column 52
    fit at line 65 column 44
    fitpredict at line 33 column 54
warning: matrix singular to machine precision
warning: called from
    logistic_regression at line 150 column 5
    privfit at line 81 column 52
    fit at line 65 column 44
    fitpredict at line 33 column 54
epsilon
   2.4483e+05
epsilon
   2.4483e+06
epsilon
   2.4483e+07
warning: matrix singular to machine precision
warning: called from
    logistic_regression at line 150 column 5
    privfit at line 81 column 52
    fit at line 65 column 44
    fitpredict at line 33 column 54
epsilon
   2.4483e+08
epsilon
   2.4483e+09
warning: matrix singular to machine precision
warning: called from
    logistic_regression at line 150 column 5
    privfit at line 81 column 52
    fit at line 65 column 44
    fitpredict at line 33 column 54
epsilon
   2.4483e+10
warning: matrix singular to machine precision
warning: called from
    logistic_regression at line 150 column 5
    privfit at line 81 column 52
    fit at line 65 column 44
    fitpredict at line 33 column 54
epsilon
   2.4483e+11
warning: matrix singular to machine precision
warning: called from
    logistic_regression at line 150 column 5
    privfit at line 81 column 52
    fit at line 65 column 44
    fitpredict at line 33 column 54
epsilon
   2.4483e+12
warning: matrix singular to machine precision
warning: called from
    logistic_regression at line 150 column 5
    privfit at line 81 column 52
    fit at line 65 column 44
    fitpredict at line 33 column 54
epsilon
   2.4483e+13
epsilon
   2.4483e+14
error: logistic_regression: epsilon too large
error: called from
    logistic_regression at line 142 column 12
    privfit at line 81 column 52
    fit at line 65 column 44
    fitpredict at line 33 column 54
>> MAE.calculateMetric(info.predictedTest,test.targets)
ans =  4.0428
>> SVOREXAlgorithem = SVOREX();
>> info = SVOREXAlgorithem.fitpredict(train,test);
>> MAE.calculateMetric(info.predictedTest,test.targets)
ans =  4.2282
>> SVORIMAlgorithem = SVORIM();
>> info = SVORIMAlgorithem.fitpredict(train,test);
>> MAE.calculateMetric(info.predictedTest,test.targets)
ans =  3.9710
>> SVORLinAlgorithem = SVORLin();
>> info = SVORLinAlgorithem.fitpredict(train,test);

>> info = NNPOMAlgorithem.fitpredict(train,test);
>> MAE.calculateMetric(info.predictedTest,test.targets)
ans =  5.9715
>> NNOPAlgorithem = NNOP();
>> info = NNOPAlgorithem.fitpredict(train,test);
>> MAE.calculateMetric(info.predictedTest,test.targets)
ans =  4.7366
>> REDSVMAlgorithem = REDSVM();
>> info = REDSVMAlgorithem.fitpredict(train,test);
>> MAE.calculateMetric(info.predictedTest,test.targets)
ans =  3.9720
>> ORBoostAlgorithem = ORBoost();
>> info = ORBoostAlgorithem.fitpredict(train,test);
Entering ORBoost Training
>> MAE.calculateMetric(info.predictedTest,test.targets)
ans =  3.3046
>> OPBEAlgorithem = OPBE();
>> info = OPBEAlgorithem.fitpredict(train,test);
>> MAE.calculateMetric(info.predictedTest,test.targets)
ans =  8.7697
>> HPOLDAlgorithem = HPOLD();
>> info = HPOLDAlgorithem.fitpredict(train,test);
>> MAE.calculateMetric(info.predictedTest,test.targets)
ans =  3.9654
>> SVC1V1Algorithem = SVC1V1();
>> info = SVC1V1Algorithem.fitpredict(train,test);
>> MAE.calculateMetric(info.predictedTest,test.targets)
ans =  4.1987
>> SVC1VAAlgorithem = SVC1VA();
>> info = SVC1VAAlgorithem.fitpredict(train,test);
>> MAE.calculateMetric(info.predictedTest,test.targets)
ans =  4.8492
>> pkg load statistics
>> info = LIBLINEARAlgorithem.fitpredict(train,test);
>> MAE.calculateMetric(info.predictedTest,test.targets)
ans =  4.2124
