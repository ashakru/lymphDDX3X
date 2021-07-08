import os
import sys
import subprocess

icgc_projects=open("icgc_files/icgc_projects.txt")
filetype=str(sys.argv[1])

# Download donor data
#for line_run in icgc_projects:
#    project=line_run.split()[0]
#
#    toDownload="donor.%s.tsv.gz" % (project)
#
#    # view bam files
#    bashCommand = 'wget https://dcc.icgc.org/api/v1/download?fn=/current/Projects/%s/%s -O %s' % (project,toDownload,toDownload)
#    print bashCommand
#    os.system(bashCommand)

# Download mutations data
for line_run in icgc_projects:
    project=line_run.split()[0]

    toDownload="%s.%s.tsv.gz" % (filetype, project)

    # view bam files
    bashCommand = 'wget https://dcc.icgc.org/api/v1/download?fn=/current/Projects/%s/%s -O icgc_files/%s' % (project,toDownload,toDownload)
    print bashCommand
    os.system(bashCommand)
