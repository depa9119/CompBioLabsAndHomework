#  Choice of the Best of the Best or the Best of the Worst? How do Intestinal Parasites Choose Their Host in _Peromyscus leucopus and P. maniculatus_

## Independent Project, Step 1:

### Introduction
The purpose of this research is to further understand the relationship between host-parasite interactions; specifically, how intestinal parasites (aka endoparasites) might choose their hosts (Peromyscus leucopus and Peromyscus maniculatus) as individuals vary in health. Do intestinal parasites target the strongest, healthiest, best fit mice as they might be a better source of nutrition or do intestinal parasites target the weakest, sickest, least fit mice because they are easy targets with immune systems ill-fitted to fight off infection. Intestinal parasites can contribute to illness or unhealthiness by taking vital nutrients from its host, leading to malnutrition, creating a deficit in the necessary resources the host finds essential in growth functions or by causing damage that prevents the host from absorbing the nutrients it ingests. In previous research, intestinal parasites have been linked to both mental and physical stunting in human children, however, when considering the prevalence of soil-transmitted helminthiases (out of 836 million children throughout the world who need treatment) only 517 million children received treatment in 2016 (WHO Reports). By using mark and recapture techniques, data about physical characteristics and feces samples was collected from the Peromyscus populations surrounding the Mountain Lake Biological Station (a University of Virginia field laboratory, Pembroke VA). My driving questions for this project is to determine trends in parasite load and/or diversity in relationship to the body condition of the infected mice (i.e. body condition is indicative of overall health). 

## Summary of Data to be Analyzed
### Goals of original study
The original experiment, referred to as the 'Mouse Lab,' focused on co-infection in wild _Peromyscus leucopus and P.maniculatus_ within the Appalachian Mountains surrounding Mountain Lake Biological Station (MLBS) between the summer months of years 2016-2018. The Mountain Lake Biological Station is located in the Jefferson National Forest surrounding Pembroke Virginia (37.375654° -80.522140°). The research was directed by the Graham Group at Princeton University (Sarah Budischak; Collaborators: Andrea Graham, Courtney Thomason). Specifically, co-infection targeted by the Mouse Lab investigated the relationship between simultanous infections of Hanta virus and endoparasites and their effect on the host immune system.  Specific original research questions include: 1. Why are hosts prone to producing overzealous responses that cost proteins and may actually even cause disease? 2. How does immunity interact with resource limitation to control parasite replication? 3. How should the immune system multitask with different types of simultaneous infections? Overall, Hanta virus (pro-inflammatory) and endoparasites (anti-inflammatory) invoke opposite types of immune responses so how does the host immune system choose when to switch from one to the other to maintain best health?

### Methodology
Data collected from P. leucopus and P. maniculatus during the 2016-2018 summer months (June-August) are collected from eight total of field sites surrounding MLBS. The eight field sites occur in groups of two grids. Each grid was sectioned to create 64 cells. Sherman live aluminum traps (3” x 3.5” x 9”) are placed in all 64 cells in both grids. Sampling is over the course of a 2-3 day cycle and all traps are removed after sampling on the last day. During each day of the trapping cycle, the traps are checked for live catch and tended to if neccessary. If a trap is successful in catching a live specimen, the trap is saved for later analysis and the specimen is kept for data collection. Data collection on the live specifimen includes, physical measurements and characteristics as well as given appropriate solution dosage assigned upon first capture (treatment: Anti-helminthic solution, control: sugar water). The saved successful trap is used for collection of fecal samples. Feces are weighed and stored in Formalin for at least 24 hours before parasite quantification. Fecal floatation tests are used to seperate endoparasites from feces, then using a mricroscope, the number and diversity of endoparasites are counted. 

**_Peromyscus_ Intestinal Parasites Oocysts/Eggs/Worms (to be quantified):**
**Cestodes**
•    Hymenolepis sp.
**Coccidia**
•    Eimeria arizonensis A 
•    Eimeria arizonensis B  
•    Eimeria delicate
**Nematodes**
•    Aspicularis Americana
•    Capillaria Americana
•    Nematode A 
•    Nematode B 
•    Syphacia peromysci
•    Larvae

### Type of Data
#### Format of data: 'xlsx' file provided
#### Access:
I am reusing raw data from my participation as part of the Mouse Lab during the Summer of 2018 at MLBS. My position was funded by the National Science Foundation (NSF) as part of the Research Experience for Undergraduates (REU) Program under the mentorship of Sarah Budischak. Unpublished data so no publication reference, however, data is owned by the Graham Lab at Princeton University.
#### Size of data: 2.2 MB
2600 captures, data covering 2016-2018 summer captures
#### Inconsistencies: 
Due to the nature of wild capture and release, data entry for each individual ranges from a single data point to data points spanning across multiple years. Thus, there is no standard number of data points for single indivduals as the target population is subject to uncontrollable factors such as predation, migration, etc.

### What does the data represent about biology?
 It is important further understand host-parasite interactions due to high prevalence and severity of intestinal parasites infection leading to lasting conseqences in human society, especially in developing countries with less access to health care. However, ethical and logistical challenges make human experiments difficult, especially concerning deworming experiments. Using _Peromyscus leucopus_ and _Peromyscus maniculatus_ as a model organism creates an ideal system for analyzing relationships between endoparasite infection and the health of the host. 

## Detailed Description of Analysis to be Done and Challenges Involved
### Challenges
+ How to define good health vs bad health?:
    * Creating code to analyze body condition/health
    * Health differences due to gender, age, reproductively active? 
    * Ectoparastic data is also available so do I seperate individuals with ectoparasites? How do ectoparasites affect health? Do I ignore it altogether?
    * Some individuals are labeled pregnant. Does pregnancy affect endoparasites? What about lactation/Visible nipples? 
    * How does anti-helminthic solution change body condition? How does it change parasite load? Does change in parasite load lead to change in body condition?

+ Analysis of Endoparasites
    * Do I analyze each species differently? Together?
    * How do I seperate effects due to a single species if there are simultaneous infection of multiple species?

+ How do I approach data points?
    * Do I take each single capture as individual data points or do I follow the same individuals over the course of a pre-specified amount of time?

### Analysis
1. Create code to list new category of body condition index (BCI) of each mouse individual as defined by Pieg, Jordi, Green 2009 to analyze health instead of body size.
2.  Subset each of the two species
3. Subset gender
4. Subset age groups
    * Subset reproductively mature in the adults
5. Independent predictors: 
    * total number of intestinal parasitic eggs (per gram of feces)
         + total number of coccidia oocytes
         + total number of cestode eggs
         + total number of nematode eggs
         + total number of nematodes
            * covariates (change in length/body condition index)
            * days since previous treatment/control
6. Linear Mixed Effect Model with random effect of individual to account for same mouse at repeated captures over the course of trapping sessions.
7. Anova test for best fit of data against change in BCI, best fit data provided by Akaike information criterion (AIC)
