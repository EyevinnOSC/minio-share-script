# MinIO Share Script

This script generates presigned URLs for files in a MinIO bucket and saves them in a JSON file. The JSON file is then uploaded back to the same bucket.

---

## Features

- Generates presigned URLs for objects in MinIO.
- Creates a JSON file containing the file name and presigned URL.
- Uploads the JSON file back to the same bucket.
- User-friendly with interactive input for bucket name and file name.

---

## System Requirements

- **Operating System**: macOS, Linux, or Windows (via WSL or Git Bash).
- **MinIO Client (`mc`)**: Installed and configured.
- **Bash**: Available in the terminal environment.

---

## Installation Instructions

You need to have a minIO insance running on Open Source Cloud. If you don't have it you can sign up for free and initiate your instance [here](www.osaas.io). No creditcard needed and you may try the service under the free account. 

For more instructions please see this [tutorial](https://eyevinntechnology.medium.com/s3-compatible-object-storage-in-open-source-cloud-3fd055d49b83).

### Install MinIO Client (`mc`)

#### macOS
1. Install `mc` using Homebrew:
  ```bash
  brew install minio/stable/mc
  ```

2. Verify the installation:
  ```bash
  mc --version
  ```

#### Windows
1.	**Download the latest version of mc from the** [MinIO downloads page](https://min.io/docs/minio/windows/index.html).
2.	**Extract the downloaded file.**
3.	**Add the extracted folder to your system’s PATH:**
	- Open Environment Variables in Windows.
	- Add the path to the folder containing mc.exe to the Path variable.
4.	**Verify the installation:**
  ```bash
  mc --version
  ```

## Script Setup
1. **Clone this repository to your local machine:**
  ```bash
  git clone https://github.com/<your-username>/minio-share-script.git
  ```
2. **Navigate to the script directory:**
  ```bash
  cd /path/to/minio-share-script
  ```
3. **Make the script executable:**
  ```bash
  chmod +x share_url_script.sh
  ```

## Usage

### Run the script
1.	**Navigate to the directory where your file is located.**
2.	**Run the script**:
  ```bash
  ./share_url_script.sh
  ```

3.	**Follow the prompts to enter**:
	- Bucket name: The MinIO bucket where the file is stored (e.g., webvideosolution/videos).
	- File name: The name of the file in the bucket (e.g., example.mp4).
4.	**The script will**:
	- Generate a presigned URL.
	- Create a JSON file (e.g., example.mp4_url.json) containing the file name and URL.
	- Upload the JSON file to the same bucket.

### Example
```bash
./share_url_script.sh
Enter the bucket name (e.g., webvideosolution/videos): webvideosolution/videos
Enter the file name (e.g., example.mp4): example.mp4
Presigned URL saved in example.mp4_url.json
JSON file uploaded to webvideosolution/videos/
```
## Important Notes

- **Run the script from the same directory as the file**: This ensures the file is easily accessible without specifying long paths.
- **Interactive Input**: The script prompts you for bucket and file names, so you don’t need to pass them as arguments.

## Example Output
Json
```bash
{
  "file": "example.mp4",
  "url": "https://your-minio-server/bucket-name/example.mp4?X-Amz-Algorithm=AWS4-HMAC-SHA256&..."
}
```
## License

This project is licensed under the MIT License, see [LICENSE](LICENSE).

# Support

Join our [community on Slack](http://slack.streamingtech.se) where you can post any questions regarding any of our open source projects. Eyevinn's consulting business can also offer you:

- Further development of this component
- Customization and integration of this component into your platform
- Support and maintenance agreement

Contact [sales@eyevinn.se](mailto:sales@eyevinn.se) if you are interested.

# About Eyevinn Technology

[Eyevinn Technology](https://www.eyevinntechnology.se) is an independent consultant firm specialized in video and streaming. Independent in a way that we are not commercially tied to any platform or technology vendor. As our way to innovate and push the industry forward we develop proof-of-concepts and tools. The things we learn and the code we write we share with the industry in [blogs](https://dev.to/video) and by open sourcing the code we have written.

Want to know more about Eyevinn and how it is to work here. Contact us at work@eyevinn.se!