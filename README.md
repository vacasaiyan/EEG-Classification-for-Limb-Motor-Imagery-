# Limb Motor Imagery For Prosthetic Control
 BCI Final Project 
 Ivan Castillo EE 

 ## Introduction
 
 - An electroencephalogram or also known as EEG is an efficient modality which helps to acquire brain signals that corresponds to various states from the scalp surface area. Usually, EEG signals have frequency range of 0.1hz to more than 100hz and are usually divided into different frequency bands depending on their functionality or relation. The most popular frequency bands are named as mu, theta, alpha, beta and gamma. This is why using EEG signals for building a BCI system for a prosthetic limb is a popular option


 - One of the biggest applications of Brain-Computer Interface (BCI) in today’s modern 
world would be its use in the area of prosthetics. With advancements in biomedical 
engineering and machine learning, we are now able to create and innovate in areas such as 
prosthetic limb control. In this projec, I wanted to introduce you ways of how to performing EEG classification for limb motor; imagery this with the objective of helping in the development of systems that uses brain signals to allow its user to easily control its prosthetic limb movement.

### Overview
- This BCI system if able to perform limb motor imagery classification by using EEG signals. It aims to explore the different methods of classification that can be used for this task, and then finally reaching a conclusion on which one is the most effective. This will provide useful information and insights for builidng a Prosthetic limb control system. I will also apply a different bandpass filter and analyze our system response
 ### Dataset

 - The dataset that will be used in this project is the BCIIV_2a which i one of the most popular datasets in the in the field of brain-computer interfaces. This dataset also contains values information regarding the topic of motor imagery.

 - **Data**

      This dataset provide use with EEG recordings of several individuals that were doing motor imagery task, being the most important ones: Tongue, foot, left and right.

   - **Data collection**
  
       Subjects were put in a quiet room in order to avoid having any distraction. EEG headsets that used the international 10- 20 system were placed on the subjects head. The number of EEG channels were 22 per subject, with the objective of captuirng any relevant brain activity.
     
   - **Datasize**

      - Subjects: 9
      - Number of channels: 22
      - Format: .csv and .gdf
      - Sampling frequency: 250hz
      - 250 data points per second per channel
      - 48 motor imagery trials per run
      - Number of TRails per session: 288
      - Number of trials per motor imagery task: 72 

   - **Format**
  
        The EEG signals had a sample frequency of 250hz and bandpass filtered form 0.5 to 100hz with 22 channels per subject.  The data is divided into different motor imagery task, in this case: Foot, left, right, tongue.

   - **Source and download LINK**

      - For the .csv version of this dataset used in usually python programs, use the following link: https://www.kaggle.com/datasets/aymanmostafa11/eeg-motor-imagery-bciciv-2a
      - For the .GDF verison of this dataset used in matlab please use the following link:  https://www.bbci.de/competition/iv/download/index.html?agree=yes&submit=Submit
      - For more information please visit: https://www.bbci.de/competition/iv/desc_2a.pdf
    
  ### Quality Evaluation 
-This dataset is reliable since it used the standard protocol for data collection and also implemented a gerta quality control system were they minimize artifacts
- There has been several academic papers that have utilize this dataset succesfully, implying that the research community sees it as an excellent dataset for BCI, here is a popular example: 
  Wang, X., Dai, X., Liu, Y., Chen, X., Hu, Q., Hu, R., & Li, M. (Year). Motor imagery electroencephalogram classification algorithm based on joint features in the spatial and frequency domains and instance transfer. Journal Name, Volume(Issue)

  - **Hidden independent components**
    This project also made sure to analyze all the hidden independent components:

      ![image](https://github.com/vacasaiyan/Limb-Motor-Imagery-For-Prosthetic-Control/assets/95666460/f2f1b9b3-a106-40d5-a7c2-c6cc2f756dfc)

  ## Framework
  The architecture followed by this project:

  ![image](https://github.com/vacasaiyan/Limb-Motor-Imagery-For-Prosthetic-Control/assets/95666460/263d7078-d7ea-4c5d-bb84-33d7496eccc6)

  - **Input:** EEG data for limb motor imagery task
  - **Output:** Accurracy of the different classification method and different bandpass filters for limb motor imagery tasks.

  - **Data preprocessing and feature extraction:**
     0 to 40hz bandpassfilter --> Normalization --> X and y defintion --> RTain and testing split

  - **Classification:**
   implement the following classifiers:
    - Gaussian Naive Bayes
    - Decision Tree
    - K-Nearest Neighbors
    - Random Forest
    - Logistic Regression
    - Linear Support Vector Machine
    - Support Vector Machine wiht RBG Kernel
   
  ## Validation
   - Our offline validation is the Train-test split, which separate our EEG data in different traind and testing sets, then we train our model so then we can evaluate its performance
   - We will also perform some evaluation metric such as, accuracy, precision and recall, and F1 score.
   - Tested on different systems the system also seems to be reliable.
 
  ## Usage
  For running 'bcifinalclassifier.py' and 'datapreprocessing.py'
   - Python environment

   **Dependecies:**
    - pandas: for data manipulation
    - numpy: Array manipulation
    - scipy: For filtering
    - sckit-learn: For machine learning models and evaluation metrics
    - matplotlib : plotting results

    **Data**:
   - 'BCICIV_2a_all_patients.csv'
   -  BCIIV .gdf files : 
`'A01E.gdf', 'A01T.gdf', 'A02E.gdf', 'A02T.gdf', 'A03E.gdf', 'A03T.gdf', 'A04E.gdf', 'A04T.gdf', 'A05E.gdf', 'A05T.gdf', 'A06E.gdf', 'A06T.gdf', 'A07E.gdf', 'A07T.gdf', 'A08E.gdf', 'A08T.gdf', 'A09E.gdf', 'A09T.gdf'`


   **Setup**
  - pip install pandas numpy scipy scikit-learn matplotlib
 
  For running 'icalabel.m'
  -Matlab environment

  **Toolboxes**
  - EEGLAB

  **EEGLAB extension:**
  - Biosig: for .GDF files
  - IClabel: For classifying independent components
  - Clean Rawdata: Used for ASR

  **Data:**
   -  BCIIV .gdf files : 
`'A01E.gdf', 'A01T.gdf', 'A02E.gdf', 'A02T.gdf', 'A03E.gdf', 'A03T.gdf', 'A04E.gdf', 'A04T.gdf', 'A05E.gdf', 'A05T.gdf', 'A06E.gdf', 'A06T.gdf', 'A07E.gdf', 'A07T.gdf', 'A08E.gdf', 'A08T.gdf', 'A09E.gdf', 'A09T.gdf'`


  **Setup:**
  - addpath('path_to_eeglab_folder');
  - ensure that the GDF files mentioned before are in a directory accesible to matlab. 

## Results:

![image](https://github.com/vacasaiyan/Limb-Motor-Imagery-For-Prosthetic-Control/assets/95666460/b6aa7c0d-aaf8-4de1-9517-3585322b8cbc)

- Other Evaluation Metrics for (0 to 40hz Bandpass:

**Naive Bayes:**

![image](https://github.com/vacasaiyan/Limb-Motor-Imagery-For-Prosthetic-Control/assets/95666460/e27d33fb-7882-44c9-8596-7b37ca217cb1)

**Decision Tree:**

![image](https://github.com/vacasaiyan/Limb-Motor-Imagery-For-Prosthetic-Control/assets/95666460/6d54f229-1fdb-488e-be43-6781c8c11423)

**K neighbors:**

![image](https://github.com/vacasaiyan/Limb-Motor-Imagery-For-Prosthetic-Control/assets/95666460/466f8116-658a-4f06-a613-f3c55d2b97c7)

**Random Forest:**

![image](https://github.com/vacasaiyan/Limb-Motor-Imagery-For-Prosthetic-Control/assets/95666460/e942a097-1b31-45d9-9f5e-9ce578932280)

**Support Vector Machine:**

![image](https://github.com/vacasaiyan/Limb-Motor-Imagery-For-Prosthetic-Control/assets/95666460/3cdc2d0d-df41-4f9f-8588-dc8542c56b93)

  
## References
 
- Lawhern, V. J., et al. (2022). Deep Learning for EEG-Based Brain-Computer Interfaces: A 
Review of Recent Advances and Future Directions. IEEE Transactions on Neural Systems 
and Rehabilitation Engineering, 30(9), 1637-1652.

- McFarland, D. J., & Wolpaw, J. R. (2011). Brain-Computer Interface Operation of Robotic 
and Prosthetic Devices. Computer (Long. Beach. Calif.), 44(10), 51-56.

- Millán, J. D. R., et al. (2010). Combining Brain-Computer Interfaces and Assistive 
Technologies: State-of-the-Art and Challenges. Frontiers in Neuroscience, 4, 1-15.

- Wolpaw, J. R., & Wolpaw, E. W. (2012). Brain-Computer Interfaces: Principles and 
Practice. Oxford University Press

- Li, Z., et al. (2023). EEG-Based Brain-Computer Interface Control of Upper Limb Prosthetics: Current 
Trends and Future Prospects. Frontiers in Neuroscience, 17, 762.
  
  
