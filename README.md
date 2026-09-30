# AI-Assisted Patent (Technology) Strategy and Analytics - Paramjit Singh
## About
Hi, I'm Param! I am a Senior Data Analytics professional with 7+ years of experience designing executive dashboards, automating analytics workflows, and delivering insights that empower strategic decision-making. 

I am skilled in SQL, Python, and range of Microsoft tools like Excel, Word, PowerPoint, PowerBI with a strong track record of presenting compelling data stories to senior leadership by refining the data into actionable insights presented through PowerBI dashboards.

This is a repository to showcase skills, share projects and track my progress in Data Analytics related topics. Considering the confidential nature of my job profile, the projects have been conducted using different datasets to showcase the skills since company data cannot be used to create portfolio.

#### Technical Skills: Python, SQL, Microsoft PowerBI, Excel, PowerPoint, Word, MATLAB, Snowflake, Patsnap, Claude

## Projects
### Patent Dataset Analysis for Strength index 
**Code:** [`PSI using csv.ipynb`](https://github.com/prmjtsingh/my-projects/blob/main/Projects/PSI%20using%20csv.ipynb)

**Description:** The Patent Strength Index (PSI) measures the relative strength of a patent portfolio by combining factors such as citation impact, geographic coverage, and legal status. Its significance lies in helping organizations, investors, and analysts quickly assess the quality and influence of patents beyond simple counts, offering a more strategic view of intellectual property value.

Using patent strength index, the company prefers to buy assets with higher expected licensing/enforcement/commercial value, avoid buying patents with high invalidation risk that lead to costly litigation. A standardized PSI speeds negotiations, reduces time in diligence, and gives procurement predictable criteria. PSI also provides a defensible audit trail showing why acquisitions were approved or declined.

So, the importance of determining patents strength index is clearly evident from the above benefits.

**Insights:** 
Decision thresholds
- 80–100 (Buy): Strong enforceability, strategic fit — proceed to acquire.
- 60–79 (Consider): Requires conditional remediation (narrow claims, confirm title, reduce price).
- <60 (Pass): Low enforceability or strategic value — decline or propose license-only.

**Skills:** Numpy, Pandas, Data cleaning, Data analysis, Matplotlib, Seaborn, Data visualization, Feature engineering, Tkinter.

### Patent Dataset Extraction from Lens API 
**Code:** [`Lens API Code.ipynb`](https://github.com/prmjtsingh/my-projects/blob/main/Projects/Lens%20API%20Code.ipynb)
**Result:** [`Lens results.json`](https://github.com/prmjtsingh/my-projects/blob/main/Projects/lens_results.json)

**Description:** The Patent dataset extraction using the defined boundary conditions is a foundational process in any patent analytics or search project. In this illustration, the patent data is extracted using Lens API for testing purposes using python.

The output is in the form of json file and can be found in the file "Lens results".

**Skills:** Numpy, Pandas, Data extraction, Json, Requests, API's.

### AI-Assisted Prior Art Search framework and workflow case study
**Problem Statement:** Novelty, invalidity, and freedom-to-operate (FTO) searches all start the same way: an analyst takes a technology -- often described only informally by a client or inventor -- and has to find the closest existing patents and non-patent literature (NPL). Historically this meant translating that description into Boolean keyword strings and iterating across multiple patent databases and literature sources, refining search terms as results came back.
This approach had a structural weakness: novel technologies are often described in language that doesn't match the vocabulary used in older, relevant prior art. A torque sensor described as 'measuring rotational force' might not match art that calls the same concept 'strain-based load detection.' Analysts compensated with experience and repeated query refinement, but this made search quality highly dependent on individual analyst expertise, slow for less common technology domains, and difficult to scale as request volume grew. An AI/LLM-based semantic search capability existed in principle, but wasn't yet integrated into a workflow analysts could trust and use directly for client-facing deliverables.

**User Research:**
- Shadowed analysts running live novelty and FTO searches across mechanical, automotive, and electronics domains to map query-refinement patterns and time spent per search.
- Reviewed historical search logs to quantify how many keyword iterations a typical search took before reaching a satisfactory reference set.
- Built a validation set of past searches with known 'gold standard' relevant references (already confirmed and cited in delivered reports) to benchmark semantic search recall against the existing keyword approach.
- Interviewed analysts and the Search Director about what would make them trust an AI-suggested reference enough to include it in a client deliverable.

**Key findings:**
- Query translation was the real bottleneck, not database access. Analysts already knew where to look; the time sink was converting a technology concept into the right keyword combinations, often through 4-6 rounds of trial and error.
- Vocabulary mismatch caused missed prior art. The validation set showed cases where highly relevant references were missed by keyword search entirely because they used different terminology for the same underlying concept -- exactly the gap semantic search was positioned to close.
- Analysts wanted to see why a match was suggested, not just a similarity score. A bare percentage next to an unfamiliar patent number wasn't enough for analysts to justify including (or excluding) it in a report they'd sign their name to.
- Cross-source search was fragmented. Patents and non-patent literature (academic papers, technical standards) lived in separate search flows, so analysts often searched NPL as an afterthought rather than as part of the same query.

**Product Goals:**
- Let analysts search for prior art using a plain-language technology description and receive ranked, explainable candidate references spanning patents and non-patent literature, cutting search time while maintaining or improving recall of truly relevant art.
- Fully automating novelty or FTO conclusions -- the tool surfaces candidates and evidence; the analyst's judgment remains the deliverable.
- Replacing Boolean/keyword search entirely -- keyword search remains available as a complementary tool for analysts who want to search a specific known term or classification code directly.

**User Stories:** 
- As a patent analyst, I want to describe a technology in plain language and get ranked candidate prior art, so I don't have to manually translate concepts into keyword strings.
- As a patent analyst, I want to see the specific passage that drove each match, so I can quickly judge relevance instead of opening every full document.
- As a patent analyst, I want patents and non-patent literature returned together in one ranked list, so I don't have to run separate searches per source.
- As a patent analyst, I want to mark a candidate as relevant or not relevant and add it directly to a report, so my search and my deliverable live in one workflow.
- As a Search Director, I want visibility into how often AI-suggested references are accepted vs. rejected, so I can gauge where the model needs improvement.
- As an ML/NLP engineer, I want every relevance judgment captured, so I can benchmark and retrain the underlying embedding model against real analyst decisions.

**Functional Requirements:**
- Natural-language query input: a single free-text box where analysts describe the technology's function and mechanism, with filters for jurisdiction, date range, technology domain, and inclusion of non-patent literature.
- Ranked, explainable results: each candidate reference shows a similarity score (High/Medium/Low band) and the specific claim or passage text that drove the match.
- Unified patent + NPL results: a single ranked list spanning both source types, clearly labeled by type.
- Relevance actions: one-click 'Add to Report' or 'Mark Not Relevant' on each candidate, captured for model evaluation.
- Report builder: selected references flow into a comparison workspace with an AI-drafted (analyst-editable) summary of overlap and risk, ready for export.

**Functional Requirements:**
- Reduce average time-to-first-relevant-reference from hours to under a few minutes.
- Improve recall of known-relevant references on the validation set by a measurable double-digit margin over keyword-only search.
- At least 80% of searches include at least one AI-suggested reference accepted into the final report.
- 100% of accept/reject decisions captured and available for model evaluation.

**Reflection and Learnings:**
- Semantic search only pays off if the evidence is visible. Recall improvements on their own didn't change analyst behavior -- showing the exact matched passage next to each score is what made analysts willing to act on a suggestion in a client deliverable.
- Unifying patents and literature in one query removed a hidden gap. Non-patent literature had effectively been a secondary, easy-to-skip step; folding it into the same ranked list made comprehensive search the default instead of an extra task.
- Relevance feedback is the highest-value byproduct. Capturing every accept/reject decision turned routine analyst work into an ongoing evaluation set for the model, which is more valuable long-term than any single search result.
- If I revisited this today: I'd build in a lightweight way for analysts to flag *why* a suggestion was rejected (wrong domain vs. wrong concept vs. outdated art), since that distinction matters more for model improvement than a simple reject count.

### Google Playstore Dataset Analysis
**Code:** [`Google Playstore Dataset Analysis.ipynb`](https://github.com/prmjtsingh/my-projects/blob/main/Projects/Google%20Playstore%20Data%20Analysis.ipynb)

**Problem Statement:** Today, 1.85 million different apps are available for users to download. Android users have even more from which to choose, with 2.56 million available through the Google Play Store. These apps have come to play a huge role in the way we live our lives today. Our Objective is to find the Most Popular Category, find the App with largest number of installs, the App with largest size etc.

**Insights:**
1. Family category has the most number of apps with 18% of apps belonging to it, followed by Games category which has 11% of the apps.
2. Least number of apps belong to the Beauty category with less than 1% of the total apps belonging to it.
3. Out of all the categories "GAME" has the most number of Installations with almost 35 Billion Installations game is the most popular Category in Google App store.
4. Most popular game is Subway Surfers.
5. Most popular communication app is Hangouts.
6. Most popular productivity app is Google Drive.
7. Most popular social app is Instagram.
8. There are 271 five rated apps on Google Play store.

**Skills:** Python, Pandas, Numpy, Seaborn, Matplotlib, data cleaning, data analysis, correlation matrices, data visualization, feature engineering.

### Dataset extraction and manipulation using SQL
**Code:** [`Data extraction and analysis using SQL.sql`](https://github.com/prmjtsingh/my-projects/blob/main/Projects/Data%20extraction%20and%20analysis%20using%20SQL.sql)

**Problem Statement:** The project includes transferring the dataset from test server to production server. The test server dataset was already used to prepare Power BI report. The dataset was extracted from test server and transferred to production server using SQL. In the process, the dataset in the production server was checked for various discrepencies and matched with dataset in the test server so that the PowerBi report works with the new dataset pulled from production server.

**Skills:** MSSQL Server, DML(Data Manipulation Language), DQL (Data Query Language), DDL (Data Definition Language).

### Loan Default Study
[Power BI file](https://github.com/prmjtsingh/my-projects/blob/main/Projects/Loan%20Study.pbix)

**Description:** The loan default dataset contains information about borrowers who have applied for a loan. Each record represents a borrower's information at the time of loan application. Along with this, the dataset includes details about their financial status, loan characteristics, and repayment behavior.

Assuming that the loans were disbursed to all borrowers, analysis is performed and a Power BI report is created to assist bank officials in making better decisions about who should be granted loans and who should not, considering the large number of cases where people defaulted.

![Loan Study](https://github.com/prmjtsingh/my-projects/blob/main/assets/img/Pic1.png)
![Loan Study](https://github.com/prmjtsingh/my-projects/blob/main/assets/img/Pic2.png)
![Loan Study](https://github.com/prmjtsingh/my-projects/blob/main/assets/img/Pic3.png)

**Insights:**
1. Loans have been issued mainly for the purpose of home and bsuiness.
2. Loans have been issued to people mostly who are employed followed by people who are self-employed.
3. The loan default rate is highest among people who are unemployed or people who are part time employed.
4. The average loan amount is highest for adults foloowed by middle age adults and then followed by senior citizens.
5. The median loan amount is highest for people with low credit score and the lowest for people with high credit score.
6. The total loan issued is highest for people with high and medium credit score.
7. Students doing Bachelor's have high loans than people doing high school. Students doing Master's or PhD have lowest loans.  This may be atrributed to the fact that students doing Master's and PhD have scholarship grants. 

## Education
University of Windsor, Canada: 
Master of Engineering, Mechanical Engineering,
Sep 2020 - Dec 2021

Panjab University, India:
Bachelor of Engineering, Mechanical Engineering,
Sep 2010 - May 2014

## Work Experience
**IP Specialist @ Conestoga (_May 2026 - Present_)**
- Lead technical discovery conversations directly with founders and researchers to evaluate technology viability and market positioning, and presenting findings that guide go/no-go commercialization decisions to Ontarion SMEs.
- Advise on innovation strategy and MVP (Minimum Viable Product) analysis across multiple active technology projects, testing proof of concepts using PatSnap’s AI powered workflows to validate technical feasibility, uncover protectable IP, and guide commercialization direction.
- Develop AI workflows using Patsnap’s and Eureka AI tools to perform technology discovery, competitive mapping, and product roadmap analysis for Ontario SMEs, helping them identify protectable innovations, strengthen IP strategy, and accelerate commercialization pathways. 
- Develop automated reports and dashboards using PatSnap’s AI workflows to deliver technical insights to Ontario SMEs, streamlining analysis and supporting data driven decisions that strengthened product commercialization efforts.

**Senior IP Analyst @ Patsnap (_April 2022 - October 2025_)**
- Designed and executed prompt-based test plans to evaluate Patsnap's AI agents for search and classification, benchmarking AI-curated output against manual analysis and advising workflow refinements that improved accuracy by 15%.
- Formulated and analyzed A/B tests comparing AI-curated vs. manual workflows, translating results into recommendations that shaped Patsnap AI feature development and roadmap sequencing.
- Conducted hands on PatSnap API testing, validating API outputs against platform results to ensure data integrity, and later expanded this work into a personal Python framework integrating public patent APIs such as Lens to automate multi source data retrieval and analysis.
- Delivered data backed recommendations and live presentations to cross functional stakeholders and external clients, strengthening alignment and increasing adoption of data driven decision making across product, engineering, and commercial teams.
- Supported end to end migration of large client datasets from competitor platforms into Patsnap, ensuring 100% data consistency through rigorous validation, reconciliation, and quality assurance checks that preserved downstream analytics accuracy. 

**Senior Associate @ Clarivate Analytics (_April 2018 - September 2020_)**
- Analyzed 5M+ product, customer, and market records using Patsnap data from partner teams, identifying inaccuracies in technical attributes and data pulls by Patsnap or by partner teams, and translating findings into actionable insights that informed client product development and improved data quality.
- Analyzed patentability, invalidity, FTO, and state of the art reports received from partner teams using Patsnap, identifying inaccuracies in technical interpretations and prior art mapping to ensure the highest level of quality and reliability delivered to clients.
- Led patent landscape and competitive intelligence projects with partner teams, identifying white space opportunities and emerging technology gaps that directly informed product feature development and strategic positioning for external clients.
- Partnered with Product and partner teams to define project goals, KPIs, and analytical frameworks, translating customer needs into prioritized roadmap decisions that strengthened alignment and accelerated delivery.
- Delivered actionable insights from patent landscape and competitive intelligence projects to external clients, enabling them to make informed product roadmap and innovation strategy decisions grounded in technology trends, white space opportunities, and emerging competitive signals.
- Served as a customer facing technical point of contact, resolving client queries on the Patsnap platform and delivering analytical findings directly to external stakeholders to strengthen adoption and ensure a seamless user experience.
- Built and maintained Excel based ETL pipelines using PatSnap and Power Query, reducing manual data preparation by 40% and accelerating insight delivery by 15% through automated, repeatable data processing workflows.
- Created and maintained user stories and acceptance criteria in Pendo, documenting platform bugs and recommending workflow improvements that strengthened product quality and enhanced the Patsnap user experience.
