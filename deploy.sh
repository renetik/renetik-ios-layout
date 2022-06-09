#!/usr/bin/env sh

# abort on errors
#set -e

# generate docs
jazzy --module RenetikLayout --swift-build-tool xcodebuild --build-tool-arguments -scheme,RenetikLayout-Package,-sdk,iphoneos

# navigate into the build output directory
#cd docs

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

#git init
#git add -A
#git commit -m 'deploy'

# if you are deploying to https://<USERNAME>.github.io
#git push -f https://github.com/rene-dohan/rene-dohan.github.io master
#git push -f https://renetik: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@github.com/renetik/renetik-ios-layout.github.io master

#git push -f https://rene-dohan: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@github.com/rene-dohan/rene-dohan.github.io master

#git push -f git@github.com:renetik-software/renetik-software.github.io.git master

# if you are deploying to https://<USERNAME>.github.io/<REPO>
#git push -f https://github.com/rene-dohan/renetik-software-portfolio.git master:gh-pages

#cd -
