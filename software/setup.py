import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="auto_pen", # Replace with your own username
    version="0.0.4",
    author="Dr. Mrs. The Mistress",
    author_email="author@example.com",
    description="A small example package",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/pypa/sampleproject",
    packages=setuptools.find_packages(),
    entry_points='''
            [console_scripts]
            auto_pen=auto_pen.cli.main:cli
        ''',
    install_requires=[
        'Click==7.0',
        'RPi.GPIO==0.7.0',
        'appdirs==1.4.3'
    ],
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: GNU Affero General Public License v3 or later (AGPLv3+)",
        "Operating System :: POSIX :: Linux",
    ],
    python_requires='>=3.7',
)