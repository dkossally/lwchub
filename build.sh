$ echo starting post install...
#install lwc local server
$ echo starting lwc dev server install...
sfdx plugins:install @salesforce/lwc-dev-server

#check for updates
$ echo searching for plugin updates...
sfdx plugins:update

cd huborg

$ echo authorizing salesforce org...
sfdx force:auth:jwt:grant --clientid 3MVG9vtcvGoeH2biMyRNJGLgiQL46v06Dmb.mRhBbekrVEGufcLH2HcoJVVE1nH1Ff27ChMiQAi2U5KVZY0fq --jwtkeyfile hubconfig/server.key --username david.kossally@silverlinecrm.com.academyui --setdefaultdevhubusername --setalias my-hub-org

$ echo creating project...
sfdx force:project:create -n project

cd project

$ echo retreiving org metadata...
sfdx force:source:retrieve -u david.kossally@silverlinecrm.com.academyui -x force-app/package.xml

$ echo creating scratch org...
sfdx force:org:create -s -f ../hubconfig/scratch-config.json -a "LWC"

$ echo pushing to scratch org...
sfdx force:source:push

$ echo starting lwc dev server...
sfdx force:lightning:lwc:start