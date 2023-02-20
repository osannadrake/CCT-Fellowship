# Search path
VPATH = data data-raw eda reports scripts

# Processed data files
DATA = cv_02_18_23.md

# EDA studies
EDA = cct_app_letter.md cct_cv.md

# Reports
REPORTS = App_Letter_OsannaDrake_CCT.md CV_OsannaDrake_CCT.md

# All targets
all : $(DATA) $(EDA) $(REPORTS)

# Data dependencies
cct_cv.md : cv_02_18_23.md

# EDA study and report dependencies
App_Letter_OsannaDrake_CCT.md : cct_app_letter.md
CV_OsannaDrake_CCT.md : cct_cv.md

# Pattern rules
%.rds : %.R
	Rscript $<
%.md : %.Rmd
	Rscript -e 'rmarkdown::render(input = "$<", output_options = list(html_preview = FALSE))'
