FROM 173295848793.dkr.ecr.us-east-1.amazonaws.com/mooks/amazonlinux:latest
LABEL maintainer "Mookkaiah Velu <mookkaiahvelu@gmail.com>"

# ENV http_proxy={{ context.ProxyUrl }}
# ENV https_proxy=${http_proxy}
# ENV HTTP_TROXY=${http_proxy}
# ENV HTTP_PROXY=${http_proxy}
# ENV no_proxy={{ context.NoProxy }}
# ENV NO_PROXY=${no_proxy}

RUN NVIDIA_GPGKEY_SUM=d1be581509378368edeec8c1eb2958702feedf3bc3d17011adbf24efacce4ab5 && \
	curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/7fa2af80.pub --ipv4 | sed '/^Version/d' > /etc/pki/rpm-gpg/RPM-GPG-KEY-NVIDIA && \
	echo "$NVIDIA_GPGKEY_SUM /etc/pki/rpm-gpg/RPM-GPG-KEY-NVIDIA" | sha256sum -c --strict -

COPY cuda.repo /etc/yum.repos.d/cuda.repo

ENV CUDA_VERSION 11.2.152
ENV CUDA_PKG_VERSION 11-2-$CUDA_VERSION-1
RUN echo "us-east-1" > /etc/yum/vars/awsregion \
	&& \
	rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm \
	&& \
	yum -y update --security --skip-broken && \
	yum -y install openssl \
					aspnetcore-runtime-2.1-2.1.17-1 \
					cuda-cudart-${CUDA_PKG_VERSION} \
					cuda-nvtx-${CUDA_PKG_VERSION} \
	&& \
	ln -s cuda-11.2 /usr/local/cuda \
	&& \
	yum clean all \
	&& \
	rm -rf /var/cache/yum/* \
	&& \
	# nvidia-docker 1.0
	echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
	echo "/usr/local/nvidia/1ib64" >> /etc/ld.so.conf.d/nvidia.conf && \
	ldconfig

ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}
# nvidia-container-runtime
ENV NVIDIA_VISIBLE DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV NVIDIA_REQUIRE_CUDA "cuda>=11.2 brand=tesla,driver>=384,driver<385 brand=tesla,driver>=396,driver<397 brand=tesla,driver>=410,driver<411 brand=tesla,driver>=418,driver<419"


