export function euclideanDistance(a, b) {
  return Math.sqrt(a.reduce((sum, val, i) => sum + Math.pow(val - b[i], 2), 0));
}

function arraysEqual(a, b) {
  if (a.length !== b.length) return false;
  return a.every((val, i) => val === b[i]);
}


export default function kMeansClustering(data, k, initialCentroids = null) {
  const centroids = initialCentroids
    ? initialCentroids.map(c => [...c]) // gunakan dari input
    : data.slice(0, k).map(row => [...row]); // default: ambil dari data awal

  let assignments = new Array(data.length).fill(-1);
  const iterations = [];
  let changed = true;
  let iterasi = 0;

  while (changed && iterasi < 100) {
    changed = false;
    iterasi++;

    // Step 1: Assign to closest centroid
    const newAssignments = data.map(point => {
      let minDist = Infinity;
      let clusterIdx = -1;
      centroids.forEach((centroid, idx) => {
        const dist = euclideanDistance(point, centroid);
        if (dist < minDist) {
          minDist = dist;
          clusterIdx = idx;
        }
      });
      return clusterIdx;
    });

    // Step 2: Recalculate centroids
    const newCentroids = Array.from({ length: k }, () => Array(data[0].length).fill(0));
    const counts = Array(k).fill(0);

    data.forEach((point, i) => {
      const cluster = newAssignments[i];
      counts[cluster]++;
      point.forEach((val, dim) => {
        newCentroids[cluster][dim] += val;
      });
    });

    newCentroids.forEach((centroid, idx) => {
      if (counts[idx] > 0) {
        centroid.forEach((_, dim) => {
          centroid[dim] /= counts[idx];
        });
      }
    });

    // Check for change
    if (!arraysEqual(assignments, newAssignments)) {
      changed = true;
    }

    iterations.push({
      iterasi,
      centroids: JSON.parse(JSON.stringify(newCentroids)),
      assignments: [...newAssignments]
    });

    centroids.forEach((c, i) => centroids[i] = [...newCentroids[i]]);
    assignments = [...newAssignments];
  }

  return {
    final_centroids: centroids,
    final_assignments: assignments,
    iterations
  };
}


// import * as math from 'mathjs';

// function euclideanDistance(a, b) {
//   return Math.sqrt(a.reduce((sum, val, i) => sum + Math.pow(val - b[i], 2), 0));
// }

// export default function kMeansClustering(data, k = 3, maxIter = 100) {
//   const n = data.length;
//   const dim = data[0].length;

//   const centroids = data
//     .slice()
//     .sort(() => Math.random() - 0.5)
//     .slice(0, k)
//     .map(d => [...d]);

//   let assignments = new Array(n).fill(-1);
//   let iter = 0;
//   const iterationLogs = [];

//   while (iter < maxIter) {
//     let hasChanged = false;

//     for (let i = 0; i < n; i++) {
//       const distances = centroids.map(c => euclideanDistance(data[i], c));
//       const closest = distances.indexOf(Math.min(...distances));
//       if (assignments[i] !== closest) {
//         hasChanged = true;
//         assignments[i] = closest;
//       }
//     }

//     iterationLogs.push({
//       iterasi: iter + 1,
//       centroids: centroids.map(c => [...c]),
//       assignments: [...assignments]
//     });

//     if (!hasChanged) break;

//     for (let j = 0; j < k; j++) {
//       const clusterPoints = data.filter((_, i) => assignments[i] === j);
//       if (clusterPoints.length > 0) {
//         const mean = math.mean(clusterPoints, 0);
//         centroids[j] = mean;
//       }
//     }

//     iter++;
//   }

//   return {
//     final_centroids: centroids,
//     final_assignments: assignments,
//     iterations: iterationLogs
//   };
// }