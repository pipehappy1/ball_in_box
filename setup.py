from setuptools import find_packages
from setuptools import setup

install_requires = [
    'numpy',
    'imageio',
    'matplotlib',
    'scipy',
    'scikit-image'
]

tests_require = [
    'pytest',
]

setup(
    name="ball_in_box",
    version="0.0.1",
    description="a project",
    packages=find_packages(),
    include_package_data=False,
    zip_safe=False,
    install_requires=install_requires,
)
