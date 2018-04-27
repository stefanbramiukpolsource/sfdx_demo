sfdx force:org:create -f config\project-scratch-def.json -a int

sfdx force:source:push -f -u int
sfdx force:apex:test:run -r human -u int

sfdx force:org:delete -p -u int