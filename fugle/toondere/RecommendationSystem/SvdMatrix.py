import numpy as np


def spSvds(data):
    U, sigma, VT = scipy.sparse.linalg.svds(data)
    sigma2 = np.mat(np.eye(len(sigma)) * sigma)
    return np.asarray(np.dot(U, sigma2))

def npSvds(data):
    U, sigma, VT = np.linalg.svd(data)
 
    sigma2 = sigma ** 2
    totalMatrix = np.sum(sigma2)

    numSingular = 0
    for i in range(len(sigma)):
        if sum(sigma2[:i]) > totalMatrix * 0.9:
            numSingular = i

    sigma3 = np.eye(numSingular) * sigma[:numSingular]

    return np.asarray(np.dot(U[:, :numSingular], sigma3))
