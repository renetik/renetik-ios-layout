#!/bin/sh
TAG="Renetik iOS:"
pullBuildDocsCommitPushModule() {
  PROJECT=$1
  SCHEME=$2
  echo "$TAG PullBuildDocsCommitPush of module $PROJECT"
  cd $PROJECT
  git push --verbose
  git pull --verbose
  if ! xcodebuild clean build analyze -scheme $SCHEME -sdk iphonesimulator \
                  -destination 'platform=iOS Simulator,name=iPhone 11'; then
    exit
  fi
  releaseDoc $PROJECT $SCHEME
  commitPush "..."
  cd ..
}
releaseDoc() {
  PROJECT=$1
  SCHEME=$2
  echo "$TAG Releasing documentation for project:$PROJECT scheme:$SCHEME"
  jazzy \
      --clean \
      --author Renetik \
      --author_url https://renetik.github.io \
      --source-host github \
      --source-host-url https://github.com/renetik/$PROJECT \
      --module $SCHEME \
      --swift-build-tool xcodebuild --build-tool-arguments \
          -scheme,$SCHEME,-sdk,iphonesimulator,-destination,"name=iPhone 12"
  git add --all docs
}
commitPush() {
  MESSAGE=$1
  echo "$TAG Commit push with message:$MESSAGE"
  git commit -a -m "$MESSAGE" --verbose
  git push --verbose
}