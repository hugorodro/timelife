import aws = require("@pulumi/aws");
import { ReplicatedBucket } from "@pulumi/aws-s3-replicated-bucket";
import pulumi = require("@pulumi/pulumi");
import mime = require("mime");
import { getCloudflareBucketPolicy } from "./constants";

const app = "timelife";

// Create an S3 bucket
const uiBucket = new aws.s3.Bucket(`${app}.dev`, {
  bucket: `${app}.dev`,
  acl: "public-read",
  serverSideEncryptionConfiguration: {
    rule: {
      applyServerSideEncryptionByDefault: {
        sseAlgorithm: "AES256",
      },
    },
  },
  website: {
    indexDocument: "index.html",
  },
  tags: {
    environment: "prod",
    application: app,
  },
  forceDestroy: true,
});

const bucketPolicy = new aws.s3.BucketPolicy(`${app}.dev-bucketPolicy`, {
  bucket: uiBucket.bucket, // depends on siteBucket -- see explanation below
  policy: getCloudflareBucketPolicy(`${app}.dev`),
  // transform the siteBucket.bucket output property -- see explanation below
});

const uiBucketWithWWW = new aws.s3.Bucket(`www.${app}.dev`, {
  bucket: `www.${app}.dev`,
  acl: "public-read",
  serverSideEncryptionConfiguration: {
    rule: {
      applyServerSideEncryptionByDefault: {
        sseAlgorithm: "AES256",
      },
    },
  },
  website: {
    indexDocument: "index.html",
  },
  tags: {
    environment: "prod",
    application: app,
  },
  forceDestroy: true,
});

const bucketPolicyWithWWW = new aws.s3.BucketPolicy(
  `www.${app}.dev-bucketPolicy`,
  {
    bucket: uiBucketWithWWW.bucket, // depends on siteBucket -- see explanation below
    policy: getCloudflareBucketPolicy(`www.${app}.dev`),
    // transform the siteBucket.bucket output property -- see explanation below
  }
);

exports.websiteUrl = uiBucket.websiteEndpoint; // output the endpoint as a stack output
