# sftp-to-s3

Docker image which provides an SFTP access to a specified S3 bucket.

## Usage

Pull the image from docker hub repository 

    docker pull emmekappa/sftp-to-s3

Run the container with 
```sh
docker run \
	-e S3_IDENTITY=changeme \
    	-e S3_CREDENTIAL=changeme \
    	-e S3_BUCKET=changeme \
    	--privileged \
	-p 222:22 \
	-d \
    	emmekappa/sftp-to-s3 
```

You have to specify the AWS credentials via `S3_IDENTITY `and `S3_CREDENTIAL`.
You have also to specify the bucket to mount via `S3_BUCKET`).
 
Now you can try to login via `sftp` using the username specified as `$S3_IDENTITY` and the password as `$S3_CREDENTIAL`.
 
    $ sftp -P 222 changeme@127.0.0.1
    changeme@127.0.0.1's password:
    Connected to 127.0.0.1.
 
## License

    This software is licensed under the Apache License, version 2 ("ALv2"), quoted below.
    
    Copyright 2009-2015 Elasticsearch <https://www.elastic.co>
    
    Licensed under the Apache License, Version 2.0 (the "License"); you may not
    use this file except in compliance with the License. You may obtain a copy of
    the License at
    
        http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
    License for the specific language governing permissions and limitations under
    the License.
