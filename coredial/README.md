## Overview

Files & instructions for building & linking pjsua into iOS application

## License

PJSIP proprietary license, for private use by CoreDial LLC
https://trac.pjsip.org/repos/wiki/PJSIP-Detail-License

## Current Version of PJSIP source

2.8 was latest release when this was forked.
Merge upstream changes in as needed

## Instructions for building and deploying the pjsip-cd pod (adjust version as necessary)

1. Fix line endings in configure-iphone
	tr -d '\r' < configure-iphone > configure-iphone.new
2. ./build.sh
	chmod u+x files as needed if failures are encountered
3. Deploy .gz file to artifactory in repo "cocoapods-local"
	Target path is pjsip-cd/
	DO NOT CHECK the box for "Deploy as bundle artifact"
