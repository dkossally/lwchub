#install lwc local server
sfdx plugins:install @salesforce/lwc-dev-server

#check for updates
sfdx plugins:update

cd huborg

sfdx force:auth:jwt:grant --clientid 3MVG9vtcvGoeH2biMyRNJGLgiQL46v06Dmb.mRhBbekrVEGufcLH2HcoJVVE1nH1Ff27ChMiQAi2U5KVZY0fq --jwtkeyfile hubconfig/server.key --username david.kossally@silverlinecrm.com.academyui --setdefaultdevhubusername --setalias my-hub-org

sfdx force:project:create -n project

cd project

sfdx force:source:retrieve -u david.kossally@silverlinecrm.com.academyui -x force-app/package.xml

sfdx force:org:create -s -f ../hubconfig/scratch-config.json -a "LWC"

sfdx force:source:push

sfdx force:lightning:lwc:start